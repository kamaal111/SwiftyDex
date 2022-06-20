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
            .font(.caption)
            .bold()
            .foregroundColor(color)
            .padding(.horizontal, .small)
            .padding(.vertical, .extraSmall)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(color, lineWidth: 2))
    }

    private var color: Color {
        type.colors.first!
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(PokemonTypes.allCases, id: \.self) { type in
                PokemonTypeView(type: type)
                    .padding(.all, .medium)
            }
        }
    }
}
