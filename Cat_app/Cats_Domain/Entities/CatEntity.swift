//
//  CatEntity.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

struct CatEntity: Decodable {
    let id: UUID
    let breedID: String
    let breedName: String
    let breedImageURL: URL?
    let lifeSpan: String
    let origin: String
    let temperament: String
    let breedDescription: String
    
    init(breedInfo: BreedEntity,
         catImageInfo: BreedImageEntity?) {
        id = UUID()
        breedID = breedInfo.id
        breedName = breedInfo.name
        breedImageURL = URL(string: catImageInfo?.imageUrl ?? "")
        lifeSpan = breedInfo.lifeSpan
        origin = breedInfo.origin
        temperament = breedInfo.temperament
        breedDescription = breedInfo.breedDescription
    }
}

extension CatEntityDB {
    func asCatEntity() -> CatEntity {
        CatEntity(breedInfo: BreedEntity(id: breedID ?? "",
                                         name: breedName ?? "",
                                         refImageId: "",
                                         lifeSpan: lifeSpan ?? "",
                                         origin: origin ?? "",
                                         temperament: temperament ?? "",
                                         breedDescription: breedDescription ?? "") ,
                  catImageInfo: BreedImageEntity(id: breedID ?? "",
                                                 imageUrl: breedImageURL ?? "") )
    }
}

extension Sequence where Element == CatEntityDB {
    func asCatEntityArray() -> [CatEntity] {
        return self.map { $0.asCatEntity() }
    }
}
