//
//  PokemonType.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 13/06/2022.
//

import SwiftUI

enum PokemonTypes: String, CaseIterable {
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

    var name: String {
        self.rawValue
    }

    var colors: [Color] {
        nameToColorHexesMap[self]?.compactMap({ Color(hex: $0) }) ?? []
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
    .fairy: ["D685AD"]
]

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            alpha = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
