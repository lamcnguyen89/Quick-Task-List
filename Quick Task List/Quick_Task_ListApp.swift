//
//  Quick_Task_ListApp.swift
//  Quick Task List
//
//  Created by Lam Nguyen on 1/9/22.
//

import SwiftUI

@main
struct Quick_Task_ListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
