//
//  CatApp.swift
//  Cat_app
//
//  Created by Oliveira, Ana Filipa on 14/06/2024.
//

import SwiftUI

@main
struct CatsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene  {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
