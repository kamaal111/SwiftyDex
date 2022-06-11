//
//  DetailColumn.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import SwiftUI

struct DetailColumn: View {
    @Binding var selection: Navigator.Screens?

    var body: some View {
        switch selection {
        case .none, .pokedex:
            PokedexScreen()
        }
    }
}

struct DetailColumn_Previews: PreviewProvider {
    static var previews: some View {
        DetailColumn(selection: .constant(.pokedex))
    }
}
