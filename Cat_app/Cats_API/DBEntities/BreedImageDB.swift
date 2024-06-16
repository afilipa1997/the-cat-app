//
//  CatEntityDB.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

struct BreedImageDB: Decodable {
    let id: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "url"
    }
}
