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
                catDB.id = cat.id
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
    
    func updateLocalCatEntity(cat: CatEntity) throws {
        let context = coreDataManager.context
        let fetchRequest: NSFetchRequest<CatEntityDB> = CatEntityDB.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", cat.id.uuidString)
        fetchRequest.fetchLimit = 1 // Fetch only the first matching object
        
        do {
            let catDBs = try context.fetch(fetchRequest)
            
            guard let catDB = catDBs.first else {
                print("No matching CatEntityDB found for ID: \(cat.id)")
                return
            }
            
            // Update properties of catDB
            catDB.breedID = cat.breedID
            catDB.breedName = cat.breedName
            catDB.breedImageURL = cat.breedImageURL?.absoluteString
            catDB.lifeSpan = cat.lifeSpan
            catDB.origin = cat.origin
            catDB.temperament = cat.temperament
            catDB.breedDescription = cat.breedDescription
            catDB.isFavourite = cat.isFavourite
            
            try context.save()
            
        } catch {
            print("Error updating local cat entity: \(error.localizedDescription)")
            throw error
        }
    }
}
