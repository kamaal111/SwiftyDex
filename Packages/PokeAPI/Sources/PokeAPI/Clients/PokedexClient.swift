//
//  PokedexClient.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import ClientKit
import Foundation
import XiphiasNet
import PokeAPIModels

public struct PokedexClient: ClientKit {
    public let networker: XiphiasNet

    private let baseURL = Constants.baseURL
        .appendingPathExtension("pokedex")

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getPokedexEntries() async -> Result<PaginatedResponse<ResponseEntry>, ClientKitErrors> {
        await getRequest(from: baseURL)
    }

    public func getPokedex(by id: Int) async -> Result<PokedexResponse, ClientKitErrors> {
        let url = baseURL
            .appendingPathExtension("\(id)")
        return await getRequest(from: url)
    }

    public func getPokedex(by region: Regions) async -> Result<PokedexResponse, ClientKitErrors> {
        await getPokedex(by: region.id)
    }
}
