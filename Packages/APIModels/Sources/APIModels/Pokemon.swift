//
//  Pokemon.swift
//
//
//  Created by Kamaal Farah on 14/06/2022.
//

import Foundation

public struct Pokemon: Hashable, Codable {
    public let name: String
    public let pokedexNumber: Int
    public let pokemonTypes: [PokemonTypes]
    public let species: String?
    public let breeding: PokemonBreeding?

    public init(
        name: String,
        pokedexNumber: Int,
        pokemonTypes: [String],
        species: String? = nil,
        breeding: PokemonBreeding? = nil
    ) {
        self.init(
            name: name,
            pokedexNumber: pokedexNumber,
            pokemonTypes: pokemonTypes.compactMap { PokemonTypes(rawValue: $0) },
            species: species,
            breeding: breeding
        )
    }

    public init(
        name: String,
        pokedexNumber: Int,
        pokemonTypes: [PokemonTypes],
        species: String? = nil,
        breeding: PokemonBreeding? = nil
    ) {
        self.name = name
        self.pokedexNumber = pokedexNumber
        self.pokemonTypes = pokemonTypes
        self.species = species
        self.breeding = breeding
    }

    public var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokedexNumber).png")
    }

    public var formattedPokedexNumber: String {
        "#\(pokedexNumber.leftPadding(toLength: 3, withPad: "0"))"
    }
}

// - TODO: MOVE TO SHRIMP EXTENSIONS

extension Int {
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        let string = String(self)
        let stringLength = string.count
        if stringLength < toLength {
            return String(repeatElement(character, count: toLength - stringLength)) + string
        }
        return String(string.suffix(toLength))
    }
}
