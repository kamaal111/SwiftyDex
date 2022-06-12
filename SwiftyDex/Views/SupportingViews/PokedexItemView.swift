//
//  PokedexItemView.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 12/06/2022.
//

import SwiftUI
import SalmonUI
import UrlImageView
import ShrimpExtensions

struct PokedexItemView: View {
    let pokemon: Pokemon
    let action: (_ pokemon: Pokemon) -> Void

    var body: some View {
        Button(action: { action(pokemon) }) {
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
}

struct PokedexItemView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexItemView(pokemon: .init(name: "bulbasaur", pokedexNumber: 1), action: { _ in })
    }
}
