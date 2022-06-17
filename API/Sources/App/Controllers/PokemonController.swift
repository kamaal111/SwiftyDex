//
//  PokemonController.swift
//  
//
//  Created by Kamaal Farah on 14/06/2022.
//

import Vapor
import PokeAPI
import APIModels
import PokeAPIModels
import ClientKit

struct PokemonController: Controller {
    private let pokeAPI: PokeAPI
    private let logger = Logger(label: "io.kamaal.api.pokemon_controler")

    init(urlSession: URLSession = .shared) {
        self.pokeAPI = PokeAPI(urlSession: urlSession)
    }

    func initializeRoutes(_ app: Application) {
        app.group("pokemon") { pokemon in
            pokemon.get("pokedex", ":id", use: getPokedex)
        }
    }

    func getPokedex(request: Request) async throws -> [Pokemon] {
        guard let id = request.parameters.get("id"), let id = Int(id)
        else { throw Abort(.badRequest, reason: "Invalid ID provided") }

        let result = await pokeAPI.pokedex.getPokedex(by: id)
        let pokedexResponse: PokedexResponse
        switch result {
        case .failure(let failure):
            throw returnClientErrorFromPokeAPI(failure)
        case .success(let success):
            pokedexResponse = success
        }

        return pokedexResponse.pokemonEntries
            .compactMap({ Pokemon(fromEntry: $0) })
    }

    private func returnClientErrorFromPokeAPI(_ error: ClientKitErrors) -> AbortError {
        switch error {
        case .parsingError(error: let error):
            logger.error("failed parsing error in PokeAPI; \(error)")
            return Abort(.internalServerError, reason: "Something went wrong")
        case .invalidURL(url: let url):
            logger.error("unknown url in PokeAPI \(url)")
            return Abort(.internalServerError, reason: "Something went wrong")
        case .notAValidJSON:
            return Abort(.internalServerError, reason: "Something went wrong")
        case .generalError(error: let error):
            logger.error("failed error in PokeAPI; \(error)")
            return Abort(.internalServerError, reason: "Something went wrong")
        case .responseError(message: let message, code: let code):
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
