//
//  PokemonDetails.swift
//
//
//  Created by Kamaal M Farah on 12/06/2022.
//

import Foundation

public struct PokemonDetails: Codable, Hashable, Identifiable {
    public let abilities: [Ability]
    public let baseExperience: Int
    public let forms: [ResponseEntry]
    public let gameIndices: [GameIndex]
    public let height: Int
    public let id: Int
    public let isDefault: Bool
    public let locationAreaEncounters: URL
    public let moves: [Move]
    public let name: String
    public let order: Int
    public let species: ResponseEntry
    public let sprites: [Sprite]
//    public let held_items: [something]
//    public let past_types: [something]

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves
        case name
        case order
        case species
        case sprites
    }

    public struct Ability: Codable, Hashable {
        public let ability: ResponseEntry
        public let isHidden: Bool
        public let slot: Int

        public init(ability: ResponseEntry, isHidden: Bool, slot: Int) {
            self.ability = ability
            self.isHidden = isHidden
            self.slot = slot
        }

        enum CodingKeys: String, CodingKey {
            case ability
            case isHidden = "is_hidden"
            case slot
        }
    }

    public struct GameIndex: Codable, Hashable {
        public let gameIndex: Int
        public let version: ResponseEntry

        public init(gameIndex: Int, version: ResponseEntry) {
            self.gameIndex = gameIndex
            self.version = version
        }

        enum CodingKeys: String, CodingKey {
            case gameIndex = "game_index"
            case version
        }
    }

    public struct Move: Codable, Hashable {
        public let move: ResponseEntry
        public let versionGroupDetails: [VersionGroupDetail]

        public init(move: ResponseEntry, versionGroupDetails: [PokemonDetails.Move.VersionGroupDetail]) {
            self.move = move
            self.versionGroupDetails = versionGroupDetails
        }

        enum CodingKeys: String, CodingKey {
            case move
            case versionGroupDetails = "version_group_details"
        }

        public struct VersionGroupDetail: Codable, Hashable {
            public let levelLearnedAt: Int
            public let moveLearnMethod: ResponseEntry
            public let versionGroup: ResponseEntry

            enum CodingKeys: String, CodingKey {
                case levelLearnedAt = "level_learned_at"
                case moveLearnMethod = "move_learn_method"
                case versionGroup = "version_group"
            }
        }
    }

    public struct Sprite: Codable, Hashable {
        public let backDefault: URL
        public let backFemale: URL?
        public let backShiny: URL
        public let backShinyFemale: URL?
        public let frontDefault: URL
        public let frontFemale: URL?
        public let other: [String: [String: URL?]]

        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backFemale = "back_female"
            case backShiny = "back_shiny"
            case backShinyFemale = "back_shiny_female"
            case frontDefault = "front_default"
            case frontFemale = "front_female"
            case other
        }
    }
}
