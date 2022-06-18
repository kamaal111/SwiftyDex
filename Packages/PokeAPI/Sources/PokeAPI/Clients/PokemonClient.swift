//
//  PokemonClient.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import ClientKit
import Foundation
import XiphiasNet
import PokeAPIModels

public struct PokemonClient: ClientKit {
    public let networker: XiphiasNet

    private let baseURL = Constants.baseURL
        .appendingPathExtension("pokemon")

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getPokemonEntries() async -> Result<PaginatedResponse<ResponseEntry>, ClientKitErrors> {
        await getRequest(from: baseURL)
    }

    public func getPokemonDetails(by pokedexNumber: Int) async -> Result<PokemonDetails, ClientKitErrors> {
        let url = baseURL
            .appendingPathExtension("\(pokedexNumber)")
        return await getRequest(from: url)
    }
}
