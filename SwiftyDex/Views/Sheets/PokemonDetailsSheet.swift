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

    @Binding var headerSize: CGSize

    let pokemon: Pokemon
    let close: () -> Void

    var body: some View {
        ZStack {
            if device == .mac {
                KSheetStack(
                    leadingNavigationButton: { Text.empty() },
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
            header
                .kBindToFrameSize($headerSize)
            tabs
        }
        .padding(.top, .medium)
        .ktakeSizeEagerly(alignment: .top)
    }

    private var header: some View {
        VStack {
            HStack(spacing: 2) {
                Text(pokemon.formattedPokedexNumber)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .bold()
                Text(pokemon.name.capitalized)
                    .font(.headline)
            }
            PokemonProfileImage(pokemon: pokemon, size: profileImageSize, withBorder: false)
            HStack {
                ForEach(pokemon.pokemonTypes, id: \.self) { type in
                    PokemonTypeView(type: type)
                }
            }
        }
    }

    private var tabs: some View {
        HStack { }
    }

    private var profileImageSize: CGFloat {
        if frameSize.width > frameSize.height {
            return frameSize.height / 3
        }
        return frameSize.width / 3
    }
}

#if DEBUG
import ShrimpExtensions

struct PokemonDetailsSheet_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsSheet(
            headerSize: .constant(.squared(300)),
            pokemon: .init(name: "charizard", pokedexNumber: 6,
                           pokemonTypes: ["fire", "flying"]),
            close: { }
        )
    }
}
#endif
