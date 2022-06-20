//
//  PokedexItemView.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 12/06/2022.
//

import SwiftUI
import SalmonUI
import APIModels

struct PokedexItemView: View {
    @Environment(\.colorScheme) var colorScheme

    let pokemon: Pokemon
    let action: (_ pokemon: Pokemon) -> Void

    private let backgroundOpacity: CGFloat = 0.01

    var body: some View {
        Button(action: { action(pokemon) }) {
            HStack {
                PokemonProfileImage(pokemon: pokemon, size: 60)
                    .padding(.horizontal, .small)
                VStack(alignment: .leading) {
                    Text(pokemon.name.capitalized)
                        .bold()
                    Text(pokemon.formattedPokedexNumber)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .ktakeWidthEagerly(alignment: .leading)
            .background(backgroundColor)
            .cornerRadius(.small)
        }
        .buttonStyle(.plain)
    }

    private var backgroundColor: Color {
        if colorScheme == .dark {
            return .black.opacity(backgroundOpacity)
        }
        return .white.opacity(backgroundOpacity)
    }
}

struct PokedexItemView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexItemView(
            pokemon: .init(name: "bulbasaur", pokedexNumber: 1, pokemonTypes: ["grass", "poison"]),
            action: { _ in }
        )
        .padding(.all, .medium)
    }
}
