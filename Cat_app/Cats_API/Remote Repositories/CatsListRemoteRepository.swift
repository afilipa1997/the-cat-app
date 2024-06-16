//
//  CatsListRemoteRepository.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

class CatsListRemoteRepository {
    
    func fetchRemoteBreedsList() async throws -> [BreedDB] {
        let endpoint = FetchBreedsListEnpoint()
        
        do {
            return try await sendRequest(endpoint: endpoint,
                                         responseModel: [BreedDB].self)
        } catch {
            print("Failed to fetch cat breeds list: \(error)")
            throw error
        }
    }
    
    func fetchRemoteCatsImage() async throws -> [BreedImageDB] {
        let endpoint = FetchImagesEndpoint()
        
        do {
            return try await sendRequest(endpoint: endpoint,
                                         responseModel: [BreedImageDB].self)
        } catch {
            print("Failed to fetch cat images: \(error)")
            throw error
        }
    }
}
