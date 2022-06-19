//
//  ContentView.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 09/06/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.device) var device

    @StateObject private var pokemonModel = PokemonModel(preview: true)
    @StateObject private var navigator = Navigator()

    var body: some View {
        ZStack {
            if device == .iPhone {
                NavigationStack(path: $navigator.path) {
                    DetailColumn(selection: $navigator.selection)
                }
            } else {
//                NavigationSplitView {
//                    Sidebar(selection: $navigator.selection)
//                } detail: {
                NavigationStack(path: $navigator.path) {
                    DetailColumn(selection: $navigator.selection)
                }
//                }
            }
        }
        #if os(macOS)
        .frame(minWidth: 600, minHeight: 450)
        #endif
        .environmentObject(pokemonModel)
        .environmentObject(navigator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
