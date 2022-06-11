//
//  DetailColumn.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import SwiftUI

struct DetailColumn: View {
    @Binding var selection: Panel?

    var body: some View {
        switch selection ?? .allPokemons {
        case .allPokemons:
            AllPokemonsScreen()
        }
    }
}

struct DetailColumn_Previews: PreviewProvider {
    static var previews: some View {
        DetailColumn(selection: .constant(.allPokemons))
    }
}
