//
//  PokemonTypes+extensions.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 14/06/2022.
//

import SwiftUI
import APIModels

extension PokemonTypes {
    var colors: [Color] {
        colorHex?.compactMap { Color(hex: $0) } ?? []
    }
}

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
            red = CGFloat((rgb & 0xFF00_0000) >> 24) / 255.0
            green = CGFloat((rgb & 0x00FF_0000) >> 16) / 255.0
            blue = CGFloat((rgb & 0x0000_FF00) >> 8) / 255.0
            alpha = CGFloat(rgb & 0x0000_00FF) / 255.0
        } else {
            return nil
        }

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
