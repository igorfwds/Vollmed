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
    var authManager = AuthenticationManager.shared
    
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

    func logout() async {
        do {
            let response = try await service.logoutPatient()
            if response {
                authManager.removeToken()
                authManager.removePatientID()
            }
        }catch {
            print("Ocorreu um erro no logout: \(error)")
        }
    }
    
}
