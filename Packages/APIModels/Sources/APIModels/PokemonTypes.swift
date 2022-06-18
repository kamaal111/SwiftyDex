//
//  PokemonTypes.swift
//
//
//  Created by Kamaal Farah on 14/06/2022.
//

import Foundation

public enum PokemonTypes: String, CaseIterable, Codable, Hashable {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy

    public var name: String {
        rawValue
    }

    public var colorHex: [String]? {
        nameToColorHexesMap[self]
    }
}

private let nameToColorHexesMap: [PokemonTypes: [String]] = [
    .normal: ["A8A77A"],
    .fire: ["EE8130"],
    .water: ["6390F0"],
    .electric: ["F7D02C"],
    .grass: ["7AC74C"],
    .ice: ["96D9D6"],
    .fighting: ["C22E28"],
    .poison: ["A33EA1"],
    .ground: ["E2BF65"],
    .flying: ["A98FF3"],
    .psychic: ["F95587"],
    .bug: ["A6B91A"],
    .rock: ["B6A136"],
    .ghost: ["735797"],
    .dragon: ["6F35FC"],
    .dark: ["705746"],
    .steel: ["B7B7CE"],
    .fairy: ["D685AD"],
]
