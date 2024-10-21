//
//  HomeNetworkingService.swift
//  Vollmed
//
//  Created by ifws on 21/10/24.
//

import Foundation

protocol HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError>
}


struct HomeNetworkingService: HTTPClient, HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError> {
        return await sendRequest(endpoit: HomeEndpoint.getAllSpecialists, responseModel: [Specialist].self)
    }
    
    
}
