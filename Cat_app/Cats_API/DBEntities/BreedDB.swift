//
//  BreedDB.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 16/06/2024.
//

import Foundation

struct BreedDB: Decodable {
    let id: String
    let name: String
    let refImageId: String?
    let lifeSpan: String
    let origin: String
    let temperament: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case refImageId = "reference_image_id"
        case lifeSpan = "life_span"
        case id
        case name
        case origin
        case temperament
        case description
    }
}
