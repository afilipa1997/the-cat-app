//
//  BreedImageEntity.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 16/06/2024.
//

import Foundation

struct BreedImageEntity {
    let id: String
    let imageUrl: String
    
}

extension BreedImageDB {
    func asBreedImageEntity() -> BreedImageEntity {
        BreedImageEntity(id: id,
                         imageUrl: imageUrl )
    }
}

extension Sequence where Element == BreedImageDB {
    func asBreedImageArray() -> [BreedImageEntity] {
        return self.map { $0.asBreedImageEntity() }
    }
}
