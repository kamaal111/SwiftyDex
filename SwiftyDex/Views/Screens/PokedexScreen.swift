//
//  PokedexScreen.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import SwiftUI
import UrlImageView
import ShrimpExtensions

struct PokedexScreen: View {
    @EnvironmentObject private var pokemonModel: PokemonModel

    var body: some View {
        Form {
            ForEach(pokemonModel.pokemons, id: \.self) { pokemon in
                HStack {
                    UrlImageView(imageUrl: pokemon.imageURL, imageSize: .squared(60))
                    Text(pokemon.name)
                }
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
