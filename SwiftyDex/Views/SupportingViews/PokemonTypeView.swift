//
//  PokemonTypeView.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 13/06/2022.
//

import SwiftUI

struct PokemonTypeView: View {
    let type: PokemonTypes

    var body: some View {
        Text(type.name.uppercased())
            .bold()
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .cornerRadius(2)
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
