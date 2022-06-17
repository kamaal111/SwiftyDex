//
//  PokedexClient.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation
import XiphiasNet
import ClientKit
import PokeAPIModels

public struct PokedexClient: ClientKit {
    public let networker: XiphiasNet

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getPokedexEntries() async -> Result<PaginatedResponse<ResponseEntry>, ClientKitErrors> {
        await getRequest(from: .pokedex)
    }

    public func getPokedex(by id: Int) async -> Result<PokedexResponse, ClientKitErrors> {
        await getRequest(from: .pokedex(id: id))
    }

    public func getPokedex(by region: Regions) async -> Result<PokedexResponse, ClientKitErrors> {
        await getPokedex(by: region.id)
    }
}

extension Endpoint {
    fileprivate static let pokedex = Endpoint(path: "/pokedex", queryItems: [])

    fileprivate static func pokedex(id: Int) -> Self {
        .init(path: "/pokedex/\(id)", queryItems: [])
    }
}
