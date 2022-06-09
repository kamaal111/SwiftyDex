//
//  ContentView.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 09/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
