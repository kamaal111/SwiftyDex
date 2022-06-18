//
//  PokemonModel.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import os.log
import PokeAPI
import APIModels
import Foundation
import PokeAPIModels
import APIClient

final class PokemonModel: NSObject, ObservableObject {
    @Published private(set) var pokemons: [Pokemon] = []

    private let pokeAPI: PokeAPI
    private let apiClient: APIClient
    private var gotInitialPokemonEntries = false
    private let preview: Bool
    private var pokemonDetailsFetched: [Int] = []

    init(preview: Bool = false) {
        self.pokeAPI = .init()
        self.apiClient = .init()
        self.preview = preview
        logger.info("initializing \"\(PokemonModel.description())\" with (preview=\(preview))")
    }

    func getInitialPokemonEntries() async {
        guard !gotInitialPokemonEntries else { return }

        gotInitialPokemonEntries = true

        let pokedexResponse: [Pokemon]
        let result = await apiClient.pokemon.getPokedex(by: 2)
        switch result {
        case let .failure(failure):
            // TODO: HANDLE ERROR IN VIEW
            logger.error("error while getting initial pokemons; \(failure.localizedDescription)")
            gotInitialPokemonEntries = false
            return
        case let .success(success):
            pokedexResponse = success
        }

        await setPokemons(pokedexResponse)
    }

    func getPokemonDetails(of pokemon: Pokemon) async {
        guard !pokemonDetailsFetched.contains(pokemon.pokedexNumber),
              let index = pokemons.firstIndex(where: { $0.name == pokemon.name }) else { return }

        let response: PokemonDetails
        let result = await pokeAPI.pokemon.getPokemonDetails(by: pokemon.pokedexNumber)
        switch result {
        case let .failure(failure):
            // TODO: HANDLE ERROR IN VIEW
            #if DEBUG
            print("failure", failure)
            #endif
            logger.error("error while getting pokemon details; \(failure.localizedDescription)")
            return
        case let .success(success):
            response = success
        }

        pokemonDetailsFetched.append(pokemon.pokedexNumber)

        let pokemonTypes = response.types
            .sorted(by: { $0.slot < $1.slot })
            .compactMap(\.type.name)
        let pokemonWithTypes = Pokemon(
            name: pokemon.name,
            pokedexNumber: pokemon.pokedexNumber,
            pokemonTypes: pokemonTypes
        )

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
