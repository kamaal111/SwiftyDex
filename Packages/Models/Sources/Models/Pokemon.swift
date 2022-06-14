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

    public init(name: String, pokedexNumber: Int, pokemonTypes: [String]) {
        self.init(name: name, pokedexNumber: pokedexNumber, pokemonTypes: pokemonTypes.compactMap({ PokemonTypes(rawValue: $0) }))
    }

    private init(name: String, pokedexNumber: Int, pokemonTypes: [PokemonTypes]) {
        self.name = name
        self.pokedexNumber = pokedexNumber
        self.pokemonTypes = pokemonTypes
    }

    public var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokedexNumber).png")
    }

    public var formattedPokedexNumber: String {
        "#\(String(pokedexNumber).leftPadding(toLength: 3, withPad: "0"))"
    }
}

extension String {
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        let stringLength = count
        if stringLength < toLength {
            return String(repeatElement(character, count: toLength - stringLength)) + self
        }
        return String(suffix(toLength))
    }
}
