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
    @Environment(\.device) private var device

    @State private var frameSize: CGSize = .zero

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
        .kBindToFrameSize($frameSize)
    }

    private var mainView: some View {
        ZStack {
            if let selectedPokemon {
                VStack {
                    HStack(spacing: 2) {
                        Text(selectedPokemon.formattedPokedexNumber)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .bold()
                        Text(selectedPokemon.name.capitalized)
                            .font(.headline)
                    }
                    PokemonProfileImage(pokemon: selectedPokemon, size: profileImageSize, withBorder: false)
                    HStack {
                        ForEach(selectedPokemon.pokemonTypes, id: \.self) { type in
                            PokemonTypeView(type: type)
                        }
                    }
                }
            }
        }
        .ktakeSizeEagerly()
    }

    private var profileImageSize: CGFloat {
        if frameSize.width > frameSize.height {
            return frameSize.height / 3
        }
        return frameSize.width / 3
    }
}

struct PokemonDetailsSheet_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsSheet(selectedPokemon: .init(name: "charizard", pokedexNumber: 6,
                                                   pokemonTypes: ["fire", "flying"]), close: { })
    }
}
