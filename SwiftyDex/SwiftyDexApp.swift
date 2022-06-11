//
//  SwiftyDexApp.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 09/06/2022.
//

import SwiftUI

@main
struct SwiftyDexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
