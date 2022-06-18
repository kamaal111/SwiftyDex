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
        }
    }

    func getPokedex(request: Request) async throws -> [Pokemon] {
        guard let id = request.parameters.get("id"), let id = Int(id)
        else { throw Abort(.badRequest, reason: "Invalid ID provided") }

        let cacheURL = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Resources")
            .appendingPathComponent("Pokedexes")
            .appendingPathComponent("\(id)")
            .appendingPathExtension("json")

        if cacheHelper.exists(cacheURL) {
            return try cacheHelper.get(from: cacheURL).get()
        }

        let response = try await pokeAPI.pokedex.getPokedex(by: id)
            .mapError(returnClientErrorFromPokeAPI)
            .map { $0.pokemonEntries.compactMap { Pokemon(fromEntry: $0) } }
            .get()

        try? cacheHelper.set(cacheURL, data: response).get()

        return response
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
        self.init(name: name, pokedexNumber: entry.entryNumber, pokemonTypes: [])
    }
}
