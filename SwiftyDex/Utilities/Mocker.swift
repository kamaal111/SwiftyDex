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
        .init(name: "bulbasaur", pokedexNumber: 1, pokemonTypes: ["grass", "poison"]),
        .init(name: "charizard", pokedexNumber: 6, pokemonTypes: ["fire", "flying"]),
        .init(name: "blastoise", pokedexNumber: 9, pokemonTypes: ["water"]),
    ]
}
#endif
