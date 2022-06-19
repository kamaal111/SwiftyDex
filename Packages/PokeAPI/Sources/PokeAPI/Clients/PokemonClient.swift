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
        .appendingPathComponent("pokemon")

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getPokemonEntries() async -> Result<PaginatedResponse<ResponseEntry>, ClientKitErrors> {
        await getRequest(from: baseURL)
    }

    public func getPokemonDetails(by pokedexNumber: Int) async -> Result<PokemonDetails, ClientKitErrors> {
        await getPokemonDetails(by: "\(pokedexNumber)")
    }

    public func getPokemonDetails(by name: String) async -> Result<PokemonDetails, ClientKitErrors> {
        let url = baseURL
            .appendingPathComponent("\(name)")
        return await getRequest(from: url)
    }
}
