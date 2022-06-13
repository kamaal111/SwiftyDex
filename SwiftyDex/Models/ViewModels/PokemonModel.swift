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
                Pokemon(name: $0.pokemonSpecies.name, pokedexNumber: $0.entryNumber, pokemonTypes: [])
            }

        await setPokemons(pokemons)
    }

    func getPokemonDetails(_ pokemon: Pokemon) async {
        guard let index = pokemons.firstIndex(where: { $0.name == pokemon.name }) else { return }

        let response: PokemonDetails
        let result = await pokeAPI.pokemon.getPokemonDetails(by: pokemon.pokedexNumber)
        switch result {
        case .failure(let failure):
            // TODO: HANDLE ERROR
            print(failure)
            return
        case .success(let success):
            response = success
        }

        let pokemonTypes = response.types
            .sorted(by: { $0.slot < $1.slot })
            .map(\.type.name)
        let pokemonWithTypes = Pokemon(name: pokemon.name, pokedexNumber: pokemon.pokedexNumber, pokemonTypes: pokemonTypes)

        await replacePokemon(at: index, with: pokemonWithTypes)
    }

    @MainActor
    private func replacePokemon(at index: Int, with pokemon: Pokemon) {
        pokemons[index] = pokemon
    }

    @MainActor
    private func setPokemons(_ pokemons: [Pokemon]) {
        self.pokemons = pokemons
    }
}

private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "pokemon_model")
