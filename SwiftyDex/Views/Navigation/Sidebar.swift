//
//  Sidebar.swift
//  SwiftyDex
//
//  Created by Kamaal Farah on 11/06/2022.
//

import SwiftUI

struct Sidebar: View {
    @Binding var selection: Navigator.Screens?

    var body: some View {
        List(selection: $selection) {
            ForEach(Navigator.Screens.allCases, id: \.self) { screen in
                NavigationLink(value: screen) {
                    Label(screen.title, systemImage: screen.icon)
                }
            }
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(selection: .constant(.pokedex))
    }
}
