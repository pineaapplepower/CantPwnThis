//
//  CantPwnThisApp.swift
//  CantPwnThis
//
//  Created by Dmitry on 21.08.2023.
//

import SwiftUI

@main
struct CantPwnThisApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
