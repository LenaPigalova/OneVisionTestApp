//
//  TeatAppApp.swift
//  TeatApp
//
//  Created by Пигалова Елена on 05/11/24.
//

import SwiftUI

@main
struct TeatAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
