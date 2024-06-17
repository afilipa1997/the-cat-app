//
//  CatsListRepository.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 16/06/2024.
//

protocol CatsListRepositoryProtocol {
    func fetchRemoteBreedsList() async throws -> [BreedEntity]
    func fetchRemoteBreedsImageList() async throws -> [BreedImageEntity]
    func saveLocalCatEntities(cats: [CatEntity]) throws
    func fetchLocalCatEntities() throws -> [CatEntity]
}

class CatsListRepository: CatsListRepositoryProtocol {
    private let remoteRepository: CatsListRemoteRepository
    private let storageRepository: CatsListStorageRepository
    
    
    init(remoteRepository: CatsListRemoteRepository,
         storageRepository: CatsListStorageRepository) {
        self.remoteRepository = remoteRepository
        self.storageRepository = storageRepository
    }
    
    func fetchRemoteBreedsList() async throws -> [BreedEntity] {
        let breedDBs = try await remoteRepository.fetchRemoteBreedsList()
        return breedDBs.asBreedArray()
    }
    
    func fetchRemoteBreedsImageList() async throws -> [BreedImageEntity] {
        let imageDBs = try await remoteRepository.fetchRemoteCatsImage()
        return imageDBs.asBreedImageArray()
    }
    
    func saveLocalCatEntities(cats: [CatEntity]) throws {
        try storageRepository.saveCatEntitiesToCoreData(cats: cats)
    }
    
    func fetchLocalCatEntities() throws -> [CatEntity] {
        try storageRepository.fetchLocalCatEntities()
    }
}
