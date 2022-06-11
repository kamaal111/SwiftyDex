//
//  PokemonModel.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation
import PokeAPI

final class PokemonModel: ObservableObject {
    @Published var pokemonEntries: [PokemonEntry] = []

    private let pokeAPI: PokeAPI

    private var gotInitialPokemonEntries = false

    init() {
        self.pokeAPI = .init()
    }

    func getInitialPokemonEntries() async {
        guard !gotInitialPokemonEntries else { return }

        gotInitialPokemonEntries = true

        let pokemonEntriesResponse: PaginatedResponse<PokemonEntry>
        let pokemonEntriesResult = await pokeAPI.pokemon.getPokemonEntries()
        switch pokemonEntriesResult {
        case .failure(let failure):
            // TODO: HANDLE ERROR
            print(failure)
            return
        case .success(let success):
            pokemonEntriesResponse = success
        }

        await setPokemonEntries(pokemonEntriesResponse.results)
    }

    @MainActor
    private func setPokemonEntries(_ pokemonEntries: [PokemonEntry]) {
        self.pokemonEntries = pokemonEntries
    }
}
