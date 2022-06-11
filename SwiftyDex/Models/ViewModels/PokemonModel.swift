//
//  PokemonModel.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation
import PokeAPI

final class PokemonModel: ObservableObject {
    @Published var pokemonEntries: [PokedexResponse.PokemonEntry] = []

    private let pokeAPI: PokeAPI

    private var gotInitialPokemonEntries = false

    init() {
        self.pokeAPI = .init()
    }

    func getInitialPokemonEntries() async {
        guard !gotInitialPokemonEntries else { return }

        gotInitialPokemonEntries = true

        let pokedexResponse: PokedexResponse
        let pokedexResult = await pokeAPI.pokedex.getPokedex(by: .kanto)
        switch pokedexResult {
        case let .failure(failure):
            // TODO: HANDLE ERROR
            print(failure)
            return
        case let .success(success):
            pokedexResponse = success
        }

        await setPokemonEntries(pokedexResponse.pokemonEntries)
    }

    @MainActor
    private func setPokemonEntries(_ pokemonEntries: [PokedexResponse.PokemonEntry]) {
        self.pokemonEntries = pokemonEntries
    }
}
