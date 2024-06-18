//
//  BreedEntity.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 16/06/2024.
//

import Foundation

struct BreedEntity {
    let id: String
    let name: String
    let refImageId: String?
    let lifeSpan: String
    let origin: String
    let temperament: String
    let breedDescription: String
}

extension BreedDB {
    func asBreedEntity() -> BreedEntity {
        BreedEntity(id: id,
                    name: name,
                    refImageId: refImageId,
                    lifeSpan: lifeSpan,
                    origin: origin,
                    temperament: temperament,
                    breedDescription: breedDescription)
    }
}

extension Sequence where Element == BreedDB {
    func asBreedArray() -> [BreedEntity] {
        return self.map { $0.asBreedEntity() }
    }
}
