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
        Text(type.name.uppercased())
            .bold()
            .foregroundColor(.white)
            .padding(.horizontal, .small)
            .padding(.vertical, .extraSmall)
            .background(backgroundColor)
            .cornerRadius(.extraExtraSmall)
    }

    private var backgroundColor: some View {
        VStack(spacing: 0) {
            ForEach(type.colors, id: \.self) { color in
                color
            }
        }
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeView(type: .flying)
    }
}
