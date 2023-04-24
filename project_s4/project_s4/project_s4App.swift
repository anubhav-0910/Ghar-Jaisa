//
//  project_s4App.swift
//  project_s4
//
//  Created by Anubhav Gupta on 23/04/23.
//

import SwiftUI

@main
struct project_s4App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
