//
//  PokemonClient.swift
//
//
//  Created by Kamaal Farah on 17/06/2022.
//

import ClientKit
import APIModels
import Foundation
import XiphiasNet

public struct PokemonClient: ClientKit {
    public let networker: XiphiasNet

    private let baseURL = URL(string: "http://localhost:8080/pokemon")!

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getPokemonDetails(by name: String) async -> Result<Pokemon, ClientKitErrors> {
        let url = baseURL
            .appendingPathComponent("details")
            .appendingPathComponent("\(name)")
        return await getRequest(from: url)
    }

    public func getPokemonDetails(by id: Int) async -> Result<Pokemon, ClientKitErrors> {
        await getPokemonDetails(by: "\(id)")
    }

    public func getPokedex(by id: Int) async -> Result<[Pokemon], ClientKitErrors> {
        let url = baseURL
            .appendingPathComponent("pokedex")
            .appendingPathComponent("\(id)")
        return await getRequest(from: url)
    }
}
