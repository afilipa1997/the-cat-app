//
//  EndpointsProtocol.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

public protocol EndpointProtocol {
    var url: URL? { get }
    var method: HttpMethod { get }
    var headers: [String: String]? { get }
    var body: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

//Defining common variables through all endpoints
extension EndpointProtocol {
    
    var headers: [String: String]? {
        let apiKey = "live_xZVazmVeZ9oR0ISVx7iwifkOpqmXRdOjKv87PI91PhdQu5KOwbxHJChBZUN6Vufd"
        return [
            "x-api-key": apiKey,
            "Content-Type": "application/json"
        ]
    }
}
