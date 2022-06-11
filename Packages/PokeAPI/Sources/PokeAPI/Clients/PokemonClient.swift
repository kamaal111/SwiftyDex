//
//  PokemonClient.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation
import XiphiasNet

public struct PokemonClient: Client {
    let networker: XiphiasNet

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getPokemonEntries() async -> Result<PaginatedResponse<ResponseEntry>, ClientErrors> {
        await getRequest(from: .pokemon)
    }
}

extension Endpoint {
    fileprivate static let pokemon = Endpoint(path: "/pokemon", queryItems: [])
}
