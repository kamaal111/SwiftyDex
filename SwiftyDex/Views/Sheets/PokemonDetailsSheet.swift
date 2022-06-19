//
//  PokemonDetailsSheet.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 12/06/2022.
//

import SwiftUI
import SalmonUI
import APIModels

struct PokemonDetailsSheet: View {
    @Environment(\.device) var device

    let selectedPokemon: Pokemon?
    let close: () -> Void

    var body: some View {
        ZStack {
            if device == .mac {
                KSheetStack(
                    leadingNavigationButton: { Text("") },
                    trailingNavigationButton: { SheetCloseButton(action: close) }
                ) {
                    mainView
                }
            } else {
                mainView
            }
        }
    }

    private var mainView: some View {
        ZStack {
            if let selectedPokemon {
                GeometryReader(content: { proxy in
                    VStack {
                        HStack(spacing: 2) {
                            Text(selectedPokemon.formattedPokedexNumber)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .bold()
                            Text(selectedPokemon.name.capitalized)
                                .font(.headline)
                        }
                        PokemonProfileImage(pokemon: selectedPokemon, size: proxy.size.width / 1.5, withBorder: false)
                        HStack {
                            ForEach(selectedPokemon.pokemonTypes, id: \.self) { type in
                                PokemonTypeView(type: type)
                            }
                        }
                    }
                    .ktakeWidthEagerly()
                })
                .padding(.horizontal, .medium)
                .padding(.bottom, .medium)
            }
        }
    }
}

struct PokemonDetailsSheet_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsSheet(selectedPokemon: .init(name: "charizard", pokedexNumber: 6,
                                                   pokemonTypes: ["fire", "flying"]), close: { })
    }
}
