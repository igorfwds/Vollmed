//
//  AuthenticationService.swift
//  Vollmed
//
//  Created by ifws on 21/10/24.
//

import Foundation

protocol AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError>
}

struct AuthenticationService: HTTPClient, AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError> {
        return await sendRequest(endpoit: AuthenticationEndpoint.logout, responseModel: nil)
    }
}
