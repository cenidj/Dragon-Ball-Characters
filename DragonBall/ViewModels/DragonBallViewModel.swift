//
//  DragonBallViewModel.swift
//  DragonBall
//
//  Created by Cesario Nivar on 1/20/24.
//

import Foundation


final class DragonBallViewModel: ObservableObject {
    
    func getCharacters() async throws -> [Character]{
        let endpoint = "https://dragonball-api.com/api/characters?limit=100"
        
        guard let url = URL(string: endpoint) else { throw NetworkError.invalidURL  }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            let dragonBallResponse = try decoder.decode(DragonBallResponse.self, from: data)
            return dragonBallResponse.items
        } catch {
            throw NetworkError.decodingData
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingData
}
