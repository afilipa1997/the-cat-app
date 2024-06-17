//
//  CatsListStorageRepository.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 17/06/2024.
//

import Foundation
import CoreData

class CatsListStorageRepository {
    
    private let coreDataManager = CoreDataManager.shared
    
    func saveCatEntitiesToCoreData(cats: [CatEntity]) throws {
        let context = coreDataManager.context
        try context.performAndWait {
            for cat in cats {
                let catDB = CatEntityDB(context: context)
                catDB.id = UUID()
                catDB.breedID = cat.breedID
                catDB.breedName = cat.breedName
                catDB.breedImageURL = cat.breedImageURL?.absoluteString
                catDB.lifeSpan = cat.lifeSpan
                catDB.origin = cat.origin
                catDB.temperament = cat.temperament
                catDB.breedDescription = cat.breedDescription
            }
            
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
                throw error
            }
        }
    }
    
    func fetchLocalCatEntities() throws -> [CatEntity] {
        let context = coreDataManager.context
        let fetchRequest: NSFetchRequest<CatEntityDB> = CatEntityDB.fetchRequest()
        
        let catDBs = try context.fetch(fetchRequest)
        
        return catDBs.asCatEntityArray()
    }
}
