//
//  PokemonProfileImage.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 12/06/2022.
//

import SwiftUI
import UrlImageView
import ShrimpExtensions
import Models

struct PokemonProfileImage: View {
    let pokemon: Pokemon
    let size: CGFloat
    let withBorder: Bool

    init(pokemon: Pokemon, size: CGFloat, withBorder: Bool = true) {
        self.pokemon = pokemon
        self.size = size
        self.withBorder = withBorder
    }

    var body: some View {
        UrlImageView(imageUrl: pokemon.imageURL, imageSize: .squared(size - (size / 15)))
            .overlay(RoundedRectangle(cornerRadius: size / 30).stroke(withBorder ? Color.accentColor : .clear, lineWidth: 2))
            .padding(.all, size / 15)
            .overlay(RoundedRectangle(cornerRadius: size / 15).stroke(withBorder ? .black : .clear, lineWidth: 1))
    }

//    private static let blueBorderColor = Color(red: 99 / 255, green: 176 / 255, blue: 244 / 255)
}

struct PokemonProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PokemonProfileImage(pokemon: .init(name: "bulbasaur", pokedexNumber: 1, pokemonTypes: ["grass", "poison"]), size: 60)
            PokemonProfileImage(pokemon: .init(name: "blastoise", pokedexNumber: 9, pokemonTypes: ["water"]), size: 260, withBorder: false)
        }
    }
}
