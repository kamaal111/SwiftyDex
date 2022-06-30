//
//  PokemonBreeding.swift
//
//
//  Created by Kamaal M Farah on 21/06/2022.
//

import Foundation

public struct PokemonBreeding: Hashable, Codable {
    public let eggGroups: [String]

    public init(eggGroups: [String]) {
        self.eggGroups = eggGroups
    }
}
