//
//  PokedexScreen.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import SwiftUI
import APIModels

struct PokedexScreen: View {
    @EnvironmentObject private var pokemonModel: PokemonModel

    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(pokemonModel.pokemons, id: \.self) { pokemon in
                        VStack {
                            PokedexItemView(pokemon: pokemon, action: { _ in onPokemonTap(pokemon) })
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, .medium)
            }
        }
        .padding(.vertical, .medium)
        .padding(.horizontal, .medium)
        .sheet(isPresented: $viewModel.showPokemonSheet, content: {
            ZStack {
                if let selectedPokemon = viewModel.selectedPokemon {
                    PokemonDetailsSheet(
                        headerSize: $viewModel.headerSize,
                        pokemon: selectedPokemon,
                        close: { viewModel.closePokemonSheet() }
                    )
                }
            }
            #if os(macOS)
            .frame(minWidth: 250, minHeight: 250)
            #else
            .presentationDetents([.height(viewModel.headerSize.height + 40), .large])
            .presentationDragIndicator(.visible)
            #endif
        })
        .navigationTitle(Text("Kanto Pokedex"))
        .onAppear(perform: handleOnAppear)
        .onChange(of: pokemonModel.pokemons, perform: onPokemonsChange)
        #if os(iOS)
            .navigationBarTitleDisplayMode(.large)
        #endif
    }

    private func onPokemonTap(_ pokemon: Pokemon) {
        Task {
            await viewModel.pokedexItemAction(pokemon)
            await pokemonModel.getPokemonDetails(of: pokemon)
        }
    }

    private func onPokemonsChange(_: [Pokemon]) {
        guard let selectedPokemon = viewModel.selectedPokemon else { return }
        guard let editedPokemonIndex = pokemonModel.pokemons
            .binarySearch(by: \.pokedexNumber, is: selectedPokemon.pokedexNumber) else { return }

        viewModel.setSelectedPokemon(pokemonModel.pokemons[editedPokemonIndex])
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

        @Published var headerSize: CGSize = .zero

        @MainActor
        func setSelectedPokemon(_ pokemon: Pokemon) {
            selectedPokemon = pokemon
        }

        func pokedexItemAction(_ pokemon: Pokemon) async {
            await setSelectedPokemon(pokemon)
        }

        @MainActor
        func closePokemonSheet() {
            showPokemonSheet = false
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
