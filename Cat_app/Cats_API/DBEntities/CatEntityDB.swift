//
//  CatEntityDB.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

struct CatEntityDB: Decodable, Identifiable {
    let id: String
    let url: URL
    let breeds: [BreedDB]
}
