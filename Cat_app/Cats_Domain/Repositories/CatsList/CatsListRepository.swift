//
//  CatsListRepository.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 16/06/2024.
//

import Combine
 
protocol CatsListRepositoryProtocol {
    func fetchRemoteBreedsList() async throws -> [BreedEntity]
    func fetchRemoteBreedsImageList() async throws -> [BreedImageEntity]
}

class CatsListRepository: CatsListRepositoryProtocol {
    private let remoteRepository: CatsListRemoteRepository
    
    init(remoteRepository: CatsListRemoteRepository) {
        self.remoteRepository = remoteRepository
    }
    
    func fetchRemoteBreedsList() async throws -> [BreedEntity] {
        let breedDBs = try await remoteRepository.fetchRemoteBreedsList()
        return breedDBs.asBreedArray()
    }
    
    func fetchRemoteBreedsImageList() async throws -> [BreedImageEntity] {
        let imageDBs = try await remoteRepository.fetchRemoteCatsImage()
        return imageDBs.asBreedImageArray()
    }
}
