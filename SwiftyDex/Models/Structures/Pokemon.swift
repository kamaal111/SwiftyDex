//
//  Pokemon.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 11/06/2022.
//

import Foundation

struct Pokemon: Hashable {
    let name: String
    let pokedexNumber: Int
    let pokemonTypes: [String]

    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokedexNumber).png")
    }

    var formattedPokedexNumber: String {
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
