//
//  PokemonDetailsAboutTab.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 20/06/2022.
//

import SwiftUI
import APIModels

struct PokemonDetailsAboutTab: View {
    let pokemon: Pokemon

    var body: some View {
        Text("Yes")
    }
}

struct PokemonDetailsAboutTab_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsAboutTab(pokemon: .init(name: "charizard", pokedexNumber: 6,
                                              pokemonTypes: ["fire", "flying"]))
    }
}
