//
//  CatsListUseCase.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 16/06/2024.
//

import Foundation

protocol CatsListUseCaseProtocol {
    func fetchCatBreedsList() async throws -> [CatEntity]
}

class CatsListUseCase: CatsListUseCaseProtocol {
    private let repository: CatsListRepositoryProtocol
    
    public init(repository: CatsListRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCatBreedsList() async throws -> [CatEntity] {
        // Fetch breeds and images concurrently using async let (both calls are done in parallel)
        async let breeds = repository.fetchRemoteBreedsList()
        async let images = repository.fetchRemoteBreedsImageList()
        
        //the results of those calls are awaited simultaneously
        let (breedsList, imagesList) = try await (breeds, images)
        
        // Map breeds and images to CatEntity instances
        let catEntities = breedsList.map { breed in
            // Find corresponding image (if exists)
            let breedImage = imagesList.first { $0.id == breed.refImageId }
            return CatEntity(breedInfo: breed,
                             catImageInfo: breedImage)
        }
        return catEntities
    }
}
