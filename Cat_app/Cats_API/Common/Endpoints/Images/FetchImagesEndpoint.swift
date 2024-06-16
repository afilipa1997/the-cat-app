//
//  FetchImagesEndpoint.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 16/06/2024.
//

import Foundation

class FetchImagesEndpoint: EndpointProtocol {
    
    var url: URL? {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else {
            fatalError("Invalid URL string")
        }
        return url
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var body: [String: String]? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "size", value: "med"),
            URLQueryItem(name: "mime_types", value: "jpg"),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "has_breeds", value: "true"),
            URLQueryItem(name: "order", value: "RANDOM"),
            URLQueryItem(name: "page", value: "0"),
            URLQueryItem(name: "limit", value: "25")
        ]
    }
}
