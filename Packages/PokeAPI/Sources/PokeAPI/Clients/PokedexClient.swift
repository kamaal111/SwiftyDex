//
//  PokedexClient.swift
//  
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation
import XiphiasNet

public struct PokedexClient: Client {
    let networker: XiphiasNet

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getPokedexEntries() async -> Result<PaginatedResponse<ResponseEntry>, ClientErrors> {
        await getRequest(from: .pokedex)
    }

    public func getPokedex(by id: Int) async -> Result<PokedexResponse, ClientErrors> {
        await getRequest(from: .pokedex(id: id))
    }

    public func getPokedex(by region: Regions) async -> Result<PokedexResponse, ClientErrors> {
        await getPokedex(by: region.id)
    }
}

private extension Endpoint {
    static let pokedex = Endpoint(path: "/pokedex", queryItems: [])

    static func pokedex(id: Int) -> Self {
        .init(path: "/pokedex/\(id)", queryItems: [])
    }
}
