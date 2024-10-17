//
//  HomeViewModel.swift
//  Vollmed
//
//  Created by ifws on 17/10/24.
//

import Foundation

struct HomeViewModel {

    // MARK: - Attributes
    
    let service = WebService()
    
    //MARK: -Class methods
    
    func getSpecialists() async throws -> [Specialist]{
        do {
            if let fetchedSpecialists = try await service.getAllSpecialists() {
                return fetchedSpecialists
            }
            return []
        }catch {
            print("Ocorreu um problema para obter os especialistas")
            throw error
        }
    }

    
}
