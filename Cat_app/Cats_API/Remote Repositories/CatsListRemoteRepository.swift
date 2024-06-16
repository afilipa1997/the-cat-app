//
//  CatsListRemoteRepository.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

class CatsListRemoteRepository {
    
    func fetchRemoteCatsList() async throws -> [CatEntityDB] {
        let endpoint = FetchCatsListEnpoint()
        
        do {
            return try await sendRequest(endpoint: endpoint, responseModel: [CatEntityDB].self)
        } catch {
            print("Failed to fetch cat images: \(error)")
            throw error
        }
    }
}
