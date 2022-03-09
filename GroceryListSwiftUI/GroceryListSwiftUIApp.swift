//
//  GroceryListSwiftUIApp.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/7/22.
//

import SwiftUI

@main
struct GroceryListSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
