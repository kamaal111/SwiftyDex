//
//  PokemonTypeView.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 13/06/2022.
//

import SwiftUI
import APIModels

struct PokemonTypeView: View {
    let type: PokemonTypes

    var body: some View {
        Text(type.name.capitalized)
            .bold()
            .foregroundColor(color)
            .padding(.horizontal, .medium)
            .padding(.vertical, .small)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(color, lineWidth: 2))
    }

    private var color: Color {
        type.colors.first!
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeView(type: .flying)
            .padding(.all, .medium)
    }
}
