//
//  CatEntity.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

struct CatEntity: Decodable {
    let id: String
    let breedName: String
    let breedImageURL: URL?
    let lifeSpan: String
    let origin: String
    let temperament: String
    let description: String
    
    init(breedInfo: BreedEntity,
         catImageInfo: BreedImageEntity?) {
        id = breedInfo.id
        breedName = breedInfo.name
        breedImageURL = URL(string: catImageInfo?.imageUrl ?? "")
        lifeSpan = breedInfo.lifeSpan
        origin = breedInfo.origin
        temperament = breedInfo.temperament
        description = breedInfo.description
    }
}
