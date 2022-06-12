//
//  PokemonProfileImage.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 12/06/2022.
//

import SwiftUI
import UrlImageView
import ShrimpExtensions

struct PokemonProfileImage: View {
    let pokemon: Pokemon
    let size: CGFloat

    var body: some View {
        UrlImageView(imageUrl: pokemon.imageURL, imageSize: .squared(size - (size / 15)))
            .overlay(RoundedRectangle(cornerRadius: size / 30).stroke(Self.blueBorderColor, lineWidth: 2))
            .padding(.all, size / 15)
            .overlay(RoundedRectangle(cornerRadius: size / 15).stroke(.black, lineWidth: 1))
    }

    private static let blueBorderColor = Color(red: 99 / 255, green: 176 / 255, blue: 244 / 255)
}

struct PokemonProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonProfileImage(pokemon: .init(name: "bulbasaur", pokedexNumber: 1), size: 60)
    }
}
