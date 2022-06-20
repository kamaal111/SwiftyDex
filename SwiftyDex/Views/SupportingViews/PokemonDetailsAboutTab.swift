//
//  PokemonDetailsAboutTab.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 20/06/2022.
//

import SwiftUI
import APIModels

struct PokemonDetailsAboutTab: View {
    let pokemon: Pokemon

    var body: some View {
        Text("Yes")
    }
}

#if DEBUG
import ShrimpExtensions

struct PokemonDetailsAboutTab_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsAboutTab(pokemon: Mocker.pokemons.find(by: \.pokedexNumber, is: 6)!)
    }
}
#endif
