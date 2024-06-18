//
//  CatsListUseCase.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 16/06/2024.
//

import Foundation

protocol CatsListUseCaseProtocol {
    func fetchCatBreedsList() async throws -> [CatEntity]
    func updateFavouriteState(cat: CatEntity) async throws
}

class CatsListUseCase: CatsListUseCaseProtocol {
    private let repository: CatsListRepositoryProtocol
    
    public init(repository: CatsListRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCatBreedsList() async throws -> [CatEntity] {
        var localCats: [CatEntity] = []
        do {
            // Try to fetch local cat entities
            localCats = try await repository.fetchLocalCatEntities()
        } catch {
            print("Failed to fetch local cats: \(error)")
        }
        
        if localCats.isEmpty {
            // If local fetch failed or returned no results, fetch from remote
            async let breeds = repository.fetchRemoteBreedsList()
            async let images = repository.fetchRemoteBreedsImageList()
            
            // Await both remote fetches simultaneously
            let (breedsList, imagesList) = try await (breeds, images)
            
            // Map breeds and images to CatEntity instances
            let catEntities = breedsList.map { breed in
                let breedImage = imagesList.first { $0.id == breed.refImageId }
                return CatEntity(id: UUID(),
                                 breedInfo: breed,
                                 catImageInfo: breedImage,
                                 isFavourite: false)
            }
            
            // Save the fetched entities to Core Data
            try repository.saveLocalCatEntities(cats: catEntities)
            
            return catEntities
        } else {
            return localCats
        }  
    }
    
    func updateFavouriteState(cat: CatEntity) throws {
        try repository.updateLocalCatEntity(cat: cat)
    }
}
