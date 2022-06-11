//
//  PokedexResponse.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation

public struct PokedexResponse: Codable, Hashable, Identifiable {
    public let descriptions: [DescriptionItem]
    public let id: Int
    public let isMainSeries: Bool
    public let name: String
    public let names: [NameItem]
    public let pokemonEntries: [PokemonEntry]
    public let region: ResponseEntry
    public let versionGroups: [ResponseEntry]

    enum CodingKeys: String, CodingKey {
        case descriptions
        case id
        case isMainSeries = "is_main_series"
        case name
        case names
        case pokemonEntries = "pokemon_entries"
        case region
        case versionGroups = "version_groups"
    }

    public struct DescriptionItem: Codable, Hashable {
        public let description: String
        public let language: ResponseEntry

        public init(description: String, language: ResponseEntry) {
            self.description = description
            self.language = language
        }
    }

    public struct NameItem: Codable, Hashable {
        public let name: String
        public let language: ResponseEntry

        public init(name: String, language: ResponseEntry) {
            self.name = name
            self.language = language
        }
    }

    public struct PokemonEntry: Codable, Hashable {
        public let entryNumber: Int
        public let pokemonSpecies: ResponseEntry

        public init(entryNumber: Int, pokemonSpecies: ResponseEntry) {
            self.entryNumber = entryNumber
            self.pokemonSpecies = pokemonSpecies
        }

        enum CodingKeys: String, CodingKey {
            case entryNumber = "entry_number"
            case pokemonSpecies = "pokemon_species"
        }
    }
}
