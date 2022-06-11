//
//  PokedexScreen.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import SwiftUI

struct PokedexScreen: View {
    @EnvironmentObject private var pokemonModel: PokemonModel

    var body: some View {
        Form {
            ForEach(pokemonModel.pokemonEntries, id: \.self) { entry in
                Text(entry.pokemonSpecies.name)
            }
        }
        .onAppear(perform: {
            Task {
                await pokemonModel.getInitialPokemonEntries()
            }
        })
    }
}

struct PokedexScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokedexScreen()
    }
}
