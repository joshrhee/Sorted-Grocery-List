//
//  GroceryListSwiftUIApp.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/7/22.
//

import SwiftUI

@main
struct GroceryListSwiftUIApp: App {
    // inject scenePhase object into my app
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { currentPhase in
            persistenceController.saveContext()
            
            if currentPhase == .active {
                print("App is Active!")
            } else if currentPhase == .inactive {
                print("App is In-Active!")
            } else if currentPhase == .background {
                print("App is in the Background!")
            }
        }
    }
}
