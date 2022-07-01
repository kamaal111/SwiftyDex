//
//  PokemonController.swift
//
//
//  Created by Kamaal Farah on 14/06/2022.
//

import Vapor
import PokeAPI
import APIModels
import ClientKit
import PokeAPIModels

struct PokemonController: Controller {
    private let pokeAPI: PokeAPI
    private let cacheHelper: CacheHelper
    private let logger: Logger

    init(urlSession: URLSession = .shared, fileManager: FileManager = .default) {
        self.pokeAPI = PokeAPI(urlSession: urlSession)
        let logger = Logger(label: "io.kamaal.api.pokemon_controler")
        self.cacheHelper = .init(fileManager: fileManager, logger: logger)
        self.logger = logger
    }

    func initializeRoutes(_ app: Application) {
        app.group("pokemon") { pokemon in
            pokemon.get("pokedex", ":id", use: getPokedex)
            pokemon.get("details", ":idOrName", use: getPokemonDetails)
        }
    }

    func getPokemonDetails(request: Request) async throws -> Pokemon {
        guard let idOrName = request.parameters.get("idOrName")
        else { throw Abort(.badRequest, reason: "Invalid ID or name provided") }

        async let species = cacheHelper.withCache(withKey: "species_\(idOrName)") {
            try await pokeAPI.pokemonSpecies.getSpecies(by: idOrName)
                .mapError(returnClientErrorFromPokeAPI(_:))
                .get()
        }
        async let details = cacheHelper.withCache(withKey: "details_\(idOrName)") {
            try await pokeAPI.pokemon.getPokemonDetails(by: idOrName)
                .mapError(returnClientErrorFromPokeAPI(_:))
                .get()
        }

        return try await Pokemon(details: details, species: species, language: "en")
    }

    func getPokedex(request: Request) async throws -> [Pokemon] {
        guard let id = request.parameters.get("id"), let id = Int(id)
        else { throw Abort(.badRequest, reason: "Invalid ID provided") }

        let pokedex = try await cacheHelper.withCache(withKey: "pokedex_\(id)") {
            try await pokeAPI.pokedex.getPokedex(by: id)
                .mapError(returnClientErrorFromPokeAPI(_:))
                .get()
        }

        return pokedex.pokemonEntries
            .compactMap(Pokemon.init(fromEntry:))
    }

    private func returnClientErrorFromPokeAPI(_ error: ClientKitErrors) -> Abort {
        switch error {
        case let .parsingError(error: error):
            logger.error("failed parsing error in PokeAPI; \(error)")
            return Abort(.internalServerError, reason: "Something went wrong")
        case let .invalidURL(url: url):
            logger.error("unknown url in PokeAPI \(url)")
            return Abort(.internalServerError, reason: "Something went wrong")
        case .notAValidJSON:
            return Abort(.internalServerError, reason: "Something went wrong")
        case let .generalError(error: error):
            logger.error("failed error in PokeAPI; \(error)")
            return Abort(.internalServerError, reason: "Something went wrong")
        case let .responseError(message: message, code: code):
            logger.error("response failure in PokeAPI; \(message)")
            if code >= 500 {
                return Abort(.failedDependency, reason: "Poke API failed")
            }
            return Abort(HTTPStatus(statusCode: code), reason: "Something went wrong")
        }
    }
}

extension Pokemon: Content { }

extension Pokemon {
    init?(fromEntry entry: PokedexResponse.PokemonEntry) {
        guard let name = entry.pokemonSpecies.name else { return nil }
        self.init(
            name: name,
            pokedexNumber: entry.entryNumber,
            pokemonTypes: [] as [String],
            species: nil,
            breeding: .none
        )
    }

    init(details: PokemonDetails, species: PokemonSpecies, language: String) {
        let pokemonTypes = details.types
            .sorted(by: \.slot, using: .orderedAscending)
            .compactMap(\.type.name)
        let eggGroups = species.eggGroups.compactMap(\.name)
        let breeding = PokemonBreeding(eggGroups: eggGroups)

        let genera = species.genera
        let species = genera
            .first(where: { $0.language.name == language })?
            .genus ?? genera
            .first(where: { $0.language.name == "en" })?
            .genus

        self.init(
            name: details.name,
            pokedexNumber: details.id,
            pokemonTypes: pokemonTypes,
            species: species,
            breeding: breeding
        )
    }
}

// - TODO: MOVE TO SHRIMP EXTENSIONS
extension Array {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, using comparison: ComparisonResult) -> [Element] {
        sorted(by: {
            switch comparison {
            case .orderedAscending:
                return $0[keyPath: keyPath] < $1[keyPath: keyPath]
            case .orderedDescending:
                return $0[keyPath: keyPath] > $1[keyPath: keyPath]
            case .orderedSame:
                return $0[keyPath: keyPath] == $1[keyPath: keyPath]
            }
        })
    }
}
