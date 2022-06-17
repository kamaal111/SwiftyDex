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
        guard let id = request.parameters.get("id"), let id = Int(id) else { throw Abort(.badRequest) }

        let result = await pokeAPI.pokedex.getPokedex(by: id)
        let pokedexResponse: PokedexResponse
        switch result {
        case .failure(let failure):
            logger.error("failed with \(failure)")
            throw Abort(.failedDependency, reason: "Poke API failed")
        case .success(let success):
            pokedexResponse = success
        }

        return pokedexResponse.pokemonEntries
            .compactMap({ Pokemon(fromEntry: $0) })
    }
}

extension Pokemon: Content { }

extension Pokemon {
    init?(fromEntry entry: PokedexResponse.PokemonEntry) {
        guard let name = entry.pokemonSpecies.name else { return nil }
        self.init(name: name, pokedexNumber: entry.entryNumber, pokemonTypes: [])
    }
}
