//
//  PokemonClient.swift
//  
//
//  Created by Kamaal Farah on 17/06/2022.
//

import Foundation
import ClientKit
import XiphiasNet
import APIModels

public struct PokemonClient: ClientKit {
    public let networker: XiphiasNet

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getPokedex(by id: Int) async -> Result<[Pokemon], ClientKitErrors> {
        await getRequest(from: .pokedex(id: id))
    }
}

extension Endpoint {
    fileprivate static func pokedex(id: Int) -> Self {
        .init(path: "/pokedex/\(id)", queryItems: [])
    }
}
