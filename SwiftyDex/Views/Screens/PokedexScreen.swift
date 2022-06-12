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
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(pokemonModel.pokemons, id: \.self) { pokemon in
                        VStack {
                            PokedexItemView(pokemon: pokemon, action: pokedexItemAction)
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .onAppear(perform: handleOnAppear)
        .navigationTitle(Text("Kanto Pokedex"))
        #if os(iOS)
            .navigationBarTitleDisplayMode(.large)
        #endif
    }

    private func pokedexItemAction(_ pokemon: Pokemon) {
        print(pokemon)
    }

    private func handleOnAppear() {
        Task {
            await pokemonModel.getInitialPokemonEntries()
        }
    }
}

struct PokedexScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokedexScreen()
    }
}
