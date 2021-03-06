//
//  Mocker.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 20/06/2022.
//

#if DEBUG
import APIModels
import Foundation

struct Mocker {
    private init() { }

    static let pokemons: [Pokemon] = [
        .init(
            name: "bulbasaur",
            pokedexNumber: 1,
            pokemonTypes: [.grass, .poison],
            species: "Seed Pokémon",
            breeding: .init(eggGroups: ["monster", "plant"])
        ),
        .init(
            name: "charizard",
            pokedexNumber: 6,
            pokemonTypes: [.fire, .flying],
            species: "Flame Pokémon",
            breeding: .init(eggGroups: ["monster", "dragon"])
        ),
        .init(
            name: "blastoise",
            pokedexNumber: 9,
            pokemonTypes: [.water],
            species: "Shellfish Pokémon",
            breeding: .init(eggGroups: ["monster", "water1"])
        ),
    ]
}
#endif
