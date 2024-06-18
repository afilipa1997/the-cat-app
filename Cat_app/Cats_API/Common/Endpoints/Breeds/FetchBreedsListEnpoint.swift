//
//  FetchCatsListEnpoint.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

class FetchBreedsListEnpoint: EndpointProtocol {
    
    var url: URL? {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
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
        return nil
    }
}
