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
    var isFavourite: Bool
    
    init(id: UUID,
         breedInfo: BreedEntity,
         catImageInfo: BreedImageEntity?,
         isFavourite: Bool) {
        self.id = id
        breedID = breedInfo.id
        breedName = breedInfo.name
        breedImageURL = URL(string: catImageInfo?.imageUrl ?? "")
        lifeSpan = breedInfo.lifeSpan
        origin = breedInfo.origin
        temperament = breedInfo.temperament
        breedDescription = breedInfo.breedDescription
        self.isFavourite = isFavourite
    }
}

extension CatEntityDB {
    func asCatEntity() -> CatEntity {
        CatEntity(id: id ?? UUID(),
                  breedInfo: BreedEntity(id: breedID ?? "",
                                         name: breedName ?? "",
                                         refImageId: "",
                                         lifeSpan: lifeSpan ?? "",
                                         origin: origin ?? "",
                                         temperament: temperament ?? "",
                                         breedDescription: breedDescription ?? "") ,
                  catImageInfo: BreedImageEntity(id: breedID ?? "",
                                                 imageUrl: breedImageURL ?? ""),
                  isFavourite: isFavourite)
    }
}

extension Sequence where Element == CatEntityDB {
    func asCatEntityArray() -> [CatEntity] {
        return self.map { $0.asCatEntity() }
    }
}
