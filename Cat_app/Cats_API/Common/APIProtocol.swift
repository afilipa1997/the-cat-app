//
//  APIProtocol.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation

/// Sends a network request and decodes the response into the specified model.
/// - Parameters:
///   - endpoint
///   - responseModel
/// - Throws: An error if the request fails or decoding fails.
/// - Returns: A decoded response model of the specified type.
public func sendRequest<T: Decodable>(endpoint: EndpointProtocol, responseModel: T.Type) async throws -> T {
    // Ensure endpoint.url is a valid URL object
    guard let url = endpoint.url else {
        throw NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue
    
    
    if let headers = endpoint.headers {
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    if let body = endpoint.body {
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
    }
    
    //    let (data, response) = try await URLSession.shared.data(for: request)
    //    guard let httpResponse = response as? HTTPURLResponse else {
    //        throw URLError(.badServerResponse)
    //    }
    
    // Mock data handling
    let jsonUrl: URL
    switch endpoint {
    case is FetchImagesEndpoint:
        jsonUrl = Bundle.main.url(forResource: "mockImageList",
                                  withExtension: "json")!
    case is FetchBreedsListEnpoint:
        jsonUrl = Bundle.main.url(forResource: "mockBreedListData", withExtension: "json")!
    default:
        jsonUrl = Bundle.main.url(forResource: "mockImageList", withExtension: "json")!
    }
    
    //let json = Bundle.main.url(forResource: "mock", withExtension: "json")!
    let data = try Data(contentsOf: jsonUrl)
    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
    return decodedResponse
}
