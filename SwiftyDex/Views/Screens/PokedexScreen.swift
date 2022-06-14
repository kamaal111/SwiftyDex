//
//  PokedexScreen.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import SwiftUI
import Models

struct PokedexScreen: View {
    @EnvironmentObject private var pokemonModel: PokemonModel

    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(pokemonModel.pokemons, id: \.self) { pokemon in
                        VStack {
                            PokedexItemView(pokemon: pokemon, action: { _ in
                                Task {
                                    await viewModel.pokedexItemAction(pokemon)
                                    await pokemonModel.getPokemonDetails(of: pokemon)
                                }
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
        .navigationTitle(Text("Kanto Pokedex"))
        .onAppear(perform: handleOnAppear)
        .onChange(of: pokemonModel.pokemons, perform: { _ in
            guard let selectedPokemon = viewModel.selectedPokemon,
                    let editedPokemon = pokemonModel.pokemons.first(where: { $0.pokedexNumber == selectedPokemon.pokedexNumber }) else { return }

            viewModel.setSelectedPokemon(editedPokemon)
        })
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
        func setSelectedPokemon(_ pokemon: Pokemon) {
            selectedPokemon = pokemon
        }

        func pokedexItemAction(_ pokemon: Pokemon) async {
            await setSelectedPokemon(pokemon)
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
        NavigationStack {
            PokedexScreen()
        }
        .environmentObject(PokemonModel(preview: true))
    }
}
