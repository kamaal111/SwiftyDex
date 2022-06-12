//
//  PokedexScreen.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import SwiftUI

struct PokedexScreen: View {
    @EnvironmentObject private var pokemonModel: PokemonModel

    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(pokemonModel.pokemons, id: \.self) { pokemon in
                        VStack {
                            PokedexItemView(pokemon: pokemon, action: { pokemon in
                                viewModel.pokedexItemAction(pokemon)
                                Task { await pokemonModel.getPokemonDetails(pokemon) }
                            })
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .sheet(isPresented: $viewModel.showPokemonSheet, content: {
            PokemonDetailsSheet(selectedPokemon: viewModel.selectedPokemon)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        })
        .onAppear(perform: handleOnAppear)
        .navigationTitle(Text("Kanto Pokedex"))
        #if os(iOS)
            .navigationBarTitleDisplayMode(.large)
        #endif
    }

    private func handleOnAppear() {
        Task { await pokemonModel.getInitialPokemonEntries() }
    }
}

extension PokedexScreen {
    final class ViewModel: ObservableObject {
        @Published var showPokemonSheet = false {
            didSet { Task { await showPokemonSheetDidSet() } }
        }

        @Published private(set) var selectedPokemon: Pokemon? {
            didSet { Task { await selectedPokemonDidSet() } }
        }

        @MainActor
        func pokedexItemAction(_ pokemon: Pokemon) {
            selectedPokemon = pokemon
        }

        @MainActor
        private func selectedPokemonDidSet() {
            if selectedPokemon != nil {
                showPokemonSheet = true
            }
        }

        @MainActor
        private func showPokemonSheetDidSet() {
            if !showPokemonSheet {
                selectedPokemon = nil
            }
        }
    }
}

struct PokedexScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokedexScreen()
            .environmentObject(PokemonModel(preview: true))
    }
}
