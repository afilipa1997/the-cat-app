//
//  FetchCatsListEnpoint.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

class FetchCatsListEnpoint: EndpointProtocol {
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
                URLQueryItem(name: "limit", value: "15")
            ]
        }
}
