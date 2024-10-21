//
//  AuthenticationEndpoint.swift
//  Vollmed
//
//  Created by ifws on 21/10/24.
//

import Foundation

enum AuthenticationEndpoint {
    case logout
}

extension AuthenticationEndpoint: Endpoint {
    var path: String {
        switch self {
        case .logout:
            return "/auth/logout"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .logout:
            return .post
        }
    }
    
    var header: [String : String]? {
        switch self{
        case .logout:
            guard let token = AuthenticationManager.shared.token else {
                return nil
            }
            
            return [
                "Authorization": "Bearer \(token)",
                "Content_Type": "application/json"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .logout:
            return nil
        }
    }
    
    
}
