//
//  TestAppApp.swift
//  TestApp
//
//  Created by Пигалова Елена on 05/11/24.
//

import SwiftUI

@main
struct TestAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ItemListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
