//
//  PokemonSpeciesClient.swift
//
//
//  Created by Kamaal M Farah on 20/06/2022.
//

import ClientKit
import Foundation
import XiphiasNet
import PokeAPIModels

public struct PokemonSpeciesClient: ClientKit {
    public let networker: XiphiasNet

    private let baseURL = Constants.baseURL
        .appendingPathComponent("pokemon-species")

    init(networker: XiphiasNet) {
        self.networker = networker
    }

    public func getSpecies(by pokedexNumber: Int) async -> Result<PokemonSpecies, ClientKitErrors> {
        await getSpecies(by: "\(pokedexNumber)")
    }

    public func getSpecies(by name: String) async -> Result<PokemonSpecies, ClientKitErrors> {
        let url = baseURL
            .appendingPathComponent("\(name)")
        return await getRequest(from: url)
    }
}
