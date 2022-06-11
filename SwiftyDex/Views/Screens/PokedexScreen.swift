//
//  PokedexScreen.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import SwiftUI
import SalmonUI
import UrlImageView
import ShrimpExtensions

struct PokedexScreen: View {
    @EnvironmentObject private var pokemonModel: PokemonModel

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(pokemonModel.pokemons, id: \.self) { pokemon in
                        HStack {
                            UrlImageView(imageUrl: pokemon.imageURL, imageSize: .squared(60))
                            VStack(alignment: .leading) {
                                Text(pokemon.name.capitalized)
                                    .bold()
                                Text(pokemon.formattedPokedexNumber)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .ktakeWidthEagerly(alignment: .leading)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .onAppear(perform: {
            Task {
                await pokemonModel.getInitialPokemonEntries()
            }
        })
        .navigationTitle(Text("Kanto Pokedex"))
    }
}

struct PokedexScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokedexScreen()
    }
}
