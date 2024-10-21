//
//  HTTPClient.swift
//  Vollmed
//
//  Created by ifws on 17/10/24.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoit: Endpoint, responseModel: T.Type?) async -> Result<T?, RequestError>
}


extension HTTPClient {
    func sendRequest<T: Decodable>(endpoit: Endpoint, responseModel: T.Type?) async -> Result<T?, RequestError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoit.scheme
        urlComponents.host = endpoit.host
        urlComponents.path = endpoit.path
        urlComponents.port = 3000
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoit.method.rawValue
        request.allHTTPHeaderFields = endpoit.header
        
        if let body = endpoit.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            switch response.statusCode {
            case 200...299:
                guard let responseModel = responseModel else {
                    return .success(nil)
                }
                
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unknown)
            }
            
        }catch {
            return .failure(.unknown)
        }
    }
}
