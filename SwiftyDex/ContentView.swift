//
//  ContentView.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 09/06/2022.
//

import SwiftUI

enum Panel: Hashable {
    case home
}

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var selection: Panel? = Panel.home

    var body: some View {
        NavigationSplitView {
            Sidebar(selection: $selection)
        } detail: {
            NavigationStack(path: $path) {
                DetailColumn(selection: $selection)
            }
        }
        .onChange(of: selection) { _ in
            path.removeLast(path.count)
        }
        #if os(macOS)
        .frame(minWidth: 600, minHeight: 450)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
