//
//  RequestError.swift
//  Vollmed
//
//  Created by ifws on 17/10/24.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unknown
    case custom(_ error: [String: Any])
    
    var customMessage: String {
        switch self {
        case .decode:
            return "erro de decodificação"
        case .unauthorized:
            return "sessão expirada"
        default:
            return "erro desconhecido"
        }
    }
}
