//
//  PokemonSpecies.swift
//
//
//  Created by Kamaal M Farah on 20/06/2022.
//

import Foundation

public struct PokemonSpecies: Codable, Hashable, Identifiable {
    public let id: Int
    public let baseHappiness: Int
    public let captureRate: Int
    public let color: ResponseEntry
    public let eggGroups: [ResponseEntry]
    public let evolutionChain: EvolutionChain
    public let evolvesFromSpecies: ResponseEntry
    public let flavorTextEntries: [FlavorTextEntries]
    public let formDescriptions: FormDescriptions
    public let formsSwitchable: Bool
    public let genderRate: Int
    public let genera: Genera
    public let generation: ResponseEntry
    public let growthRate: ResponseEntry
    public let habitat: ResponseEntry
    public let hasGenderDifferences: Bool
    public let hatchCounter: Int
    public let isBaby: Bool
    public let isLegendary: Bool
    public let isMythical: Bool
    public let name: String
    public let names: [Name]
    public let order: Int
    public let palParkEncounters: [PalParkEncounters]
    public let pokedexNumbers: [PokedexNumbers]
    public let shape: ResponseEntry
    public let varieties: [Varieties]

    public init(
        id: Int,
        baseHappiness: Int,
        captureRate: Int,
        color: ResponseEntry,
        eggGroups: [ResponseEntry],
        evolutionChain: EvolutionChain,
        evolvesFromSpecies: ResponseEntry,
        flavorTextEntries: [FlavorTextEntries],
        formDescriptions: FormDescriptions,
        formsSwitchable: Bool,
        genderRate: Int,
        genera: Genera,
        generation: ResponseEntry,
        growthRate: ResponseEntry,
        habitat: ResponseEntry,
        hasGenderDifferences: Bool,
        hatchCounter: Int,
        isBaby: Bool,
        isLegendary: Bool,
        isMythical: Bool,
        name: String,
        names: [Name],
        order: Int,
        palParkEncounters: [PalParkEncounters],
        pokedexNumbers: [PokedexNumbers],
        shape: ResponseEntry,
        varieties: [Varieties]
    ) {
        self.id = id
        self.baseHappiness = baseHappiness
        self.captureRate = captureRate
        self.color = color
        self.eggGroups = eggGroups
        self.evolutionChain = evolutionChain
        self.evolvesFromSpecies = evolvesFromSpecies
        self.flavorTextEntries = flavorTextEntries
        self.formDescriptions = formDescriptions
        self.formsSwitchable = formsSwitchable
        self.genderRate = genderRate
        self.genera = genera
        self.generation = generation
        self.growthRate = growthRate
        self.habitat = habitat
        self.hasGenderDifferences = hasGenderDifferences
        self.hatchCounter = hatchCounter
        self.isBaby = isBaby
        self.isLegendary = isLegendary
        self.isMythical = isMythical
        self.name = name
        self.names = names
        self.order = order
        self.palParkEncounters = palParkEncounters
        self.pokedexNumbers = pokedexNumbers
        self.shape = shape
        self.varieties = varieties
    }

    enum CodingKeys: String, CodingKey {
        case id
        case baseHappiness = "base_happiness"
        case captureRate = "capture_rate"
        case color
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        case formDescriptions = "form_descriptions"
        case formsSwitchable = "forms_switchable"
        case genderRate = "gender_rate"
        case genera
        case generation
        case growthRate = "growth_rate"
        case habitat
        case hasGenderDifferences = "has_gender_differences"
        case hatchCounter = "hatch_counter"
        case isBaby = "is_baby"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case name
        case names
        case order
        case palParkEncounters = "pal_park_encounters"
        case pokedexNumbers = "pokedex_numbers"
        case shape
        case varieties
    }

    public struct EvolutionChain: Codable, Hashable {
        public let url: URL

        public init(url: URL) {
            self.url = url
        }
    }

    public struct FlavorTextEntries: Codable, Hashable {
        public let flavorText: String
        public let language: ResponseEntry
        public let version: ResponseEntry

        public init(flavorText: String, language: ResponseEntry, version: ResponseEntry) {
            self.flavorText = flavorText
            self.language = language
            self.version = version
        }

        enum CodingKeys: String, CodingKey {
            case flavorText = "flavor_text"
            case language
            case version
        }
    }

    public struct FormDescriptions: Codable, Hashable {
        public let description: String
        public let language: ResponseEntry

        public init(description: String, language: ResponseEntry) {
            self.description = description
            self.language = language
        }
    }

    public struct Genera: Codable, Hashable {
        public let genus: String
        public let language: ResponseEntry

        public init(genus: String, language: ResponseEntry) {
            self.genus = genus
            self.language = language
        }
    }

    public struct Name: Codable, Hashable {
        public let language: ResponseEntry
        public let name: String

        public init(language: ResponseEntry, name: String) {
            self.language = language
            self.name = name
        }
    }

    public struct PalParkEncounters: Codable, Hashable {
        public let area: ResponseEntry
        public let baseScore: Int
        public let rate: Int

        public init(area: ResponseEntry, baseScore: Int, rate: Int) {
            self.area = area
            self.baseScore = baseScore
            self.rate = rate
        }

        enum CodingKeys: String, CodingKey {
            case area
            case baseScore = "base_score"
            case rate
        }
    }

    public struct PokedexNumbers: Codable, Hashable {
        public let entryNumber: Int
        public let pokedex: ResponseEntry

        public init(entryNumber: Int, pokedex: ResponseEntry) {
            self.entryNumber = entryNumber
            self.pokedex = pokedex
        }

        enum CodingKeys: String, CodingKey {
            case entryNumber = "entry_number"
            case pokedex
        }
    }

    public struct Varieties: Codable, Hashable {
        public let isDefault: Int
        public let pokemon: ResponseEntry

        enum CodingKeys: String, CodingKey {
            case isDefault = "is_default"
            case pokemon
        }
    }
}
