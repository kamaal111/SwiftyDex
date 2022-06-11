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

    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokedexNumber).png")
    }
}
