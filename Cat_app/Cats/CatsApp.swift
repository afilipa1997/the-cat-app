//
//  CatApp.swift
//  Cat_app
//
//  Created by Oliveira, Ana Filipa on 14/06/2024.
//

import SwiftUI

@main
struct CatsApp: App {
    let coreDataManager = CoreDataManager.shared

    var body: some Scene  {
        WindowGroup {
            BreedListContentView()
                .environment(\.managedObjectContext, coreDataManager.persistentContainer.viewContext)
        }
    }
}
