//
//  PokemonClient.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation
import XiphiasNet
import ClientKit

public struct PokemonClient: ClientKit {
    public let networker: XiphiasNet

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getPokemonEntries() async -> Result<PaginatedResponse<ResponseEntry>, ClientKitErrors> {
        await getRequest(from: .pokemon)
    }

    public func getPokemonDetails(by pokedexNumber: Int) async -> Result<PokemonDetails, ClientKitErrors> {
        await getRequest(from: .pokemon(by: pokedexNumber))
    }
}

extension Endpoint {
    fileprivate static let pokemon = Endpoint(path: "/pokemon", queryItems: [])

    fileprivate static func pokemon(by pokedexNumber: Int) -> Endpoint {
        Endpoint(path: "/pokemon/\(pokedexNumber)", queryItems: [])
    }
}
