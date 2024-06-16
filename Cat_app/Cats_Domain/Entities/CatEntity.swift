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
    let breedImageURL: URL
    let life_span: String
    let origin: String
    let temperament: String
    let description: String
}
