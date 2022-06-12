//
//  PokemonModel.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import PokeAPI
import Foundation
import os.log

final class PokemonModel: NSObject, ObservableObject {
    @Published private(set) var pokemons: [Pokemon] = []

    private let pokeAPI: PokeAPI
    private var gotInitialPokemonEntries = false
    private let preview: Bool

    init(preview: Bool = false) {
        self.pokeAPI = .init()
        self.preview = preview
        logger.info("initializing \"\(PokemonModel.description())\" with (preview=\(preview))")
    }

    func getInitialPokemonEntries() async {
        guard !gotInitialPokemonEntries else { return }

        gotInitialPokemonEntries = true

        let pokedexResponse: PokedexResponse
        let pokedexResult = await pokeAPI.pokedex.getPokedex(by: .kanto, sample: preview)
        switch pokedexResult {
        case let .failure(failure):
            // TODO: HANDLE ERROR
            print(failure)
            return
        case let .success(success):
            pokedexResponse = success
        }

        let pokemons = pokedexResponse.pokemonEntries
            .map {
                Pokemon(name: $0.pokemonSpecies.name, pokedexNumber: $0.entryNumber)
            }

        await setPokemons(pokemons)
    }

    @MainActor
    private func setPokemons(_ pokemons: [Pokemon]) {
        self.pokemons = pokemons
    }
}

private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "pokemon_model")
