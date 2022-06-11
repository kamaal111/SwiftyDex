//
//  PokeAPI.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation
import XiphiasNet

public struct PokeAPI {
    public let pokemon: PokemonClient

    public init() {
        self.init(urlSession: .shared)
    }

    public init(urlSession: URLSession) {
        let networker = XiphiasNet(urlSession: urlSession)
        self.pokemon = .init(networker: networker)
    }
}
