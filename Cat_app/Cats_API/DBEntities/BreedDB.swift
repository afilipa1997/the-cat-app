//
//  BreedDB.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 16/06/2024.
//

import Foundation

struct BreedDB: Decodable, Identifiable {
    let id: String
    let name: String
    let life_span: String
    let origin: String
    let temperament: String
    let description: String
}
