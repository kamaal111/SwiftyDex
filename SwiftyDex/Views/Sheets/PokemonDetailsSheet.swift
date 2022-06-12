//
//  PokemonDetailsSheet.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 12/06/2022.
//

import SwiftUI
import SalmonUI

struct PokemonDetailsSheet: View {
    let selectedPokemon: Pokemon?

    var body: some View {
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
                        PokemonProfileImage(pokemon: selectedPokemon, size: proxy.size.width / 1.5)
                    }
                    .ktakeWidthEagerly()
                })
                .padding(.all, 16)
            }
        }
    }
}

struct PokemonDetailsSheet_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsSheet(selectedPokemon: .init(name: "bulbasaur", pokedexNumber: 1))
    }
}
