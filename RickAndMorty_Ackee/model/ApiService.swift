//
//  API.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

struct InvalidURL: Error { }

struct CharacterNotExistend: Error {
    let id: Int
}

protocol HasApiDependency {
    var apiService: ApiServicing {get}
}


protocol ApiServicing {
    func makeRequest(query: [URLQueryItem]) async throws -> [Character]
    func getPage(page: Int) async throws -> [Character]
    func searchCharactersByName(query: String) async throws -> [Character]
    func getCharactersByID(ids: [Int]) async throws -> [Character]
    func character(id: Int) async throws -> Character
}


final class ApiService: ApiServicing {
    
    func makeRequest(query: [URLQueryItem] = []) async throws -> [Character] {
        var components = URLComponents(
            url: URL(string: "https://rickandmortyapi.com/api/character")!,
            resolvingAgainstBaseURL: false
        )
        if !query.isEmpty {
            components?.queryItems = query
        }
        
        guard let url = components?.url else { throw InvalidURL() }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(ApiResponse.self, from: data)
            return decoded.results
        } catch {
            return []
        }
    }
    
    func getPage(page: Int = 1) async throws -> [Character] {
        let query = page > 1 ? [URLQueryItem(name: "page", value: String(page))] : []
        return try await makeRequest(query: query)
    }
    
    func searchCharactersByName(query: String) async throws -> [Character] {
        let queryItems: [URLQueryItem] = [
            .init(name: "name", value: query)
        ]
        return try await makeRequest(query: queryItems)
    }
    
    func getCharactersByID(ids: [Int]) async throws -> [Character] {
        try await withThrowingTaskGroup(of: Character.self) { group in
            var characters: [Character] = []
            characters.reserveCapacity(ids.count)
            
            for id in ids {
                group.addTask {
                    try await self.character(id: id)
                }
            }
            
            for try await character in group {
                characters.append(character)
            }
            
            return characters
                .sorted {
                    let lhs = ids.firstIndex(of: $0.id) ?? ids.count
                    let rhs = ids.firstIndex(of: $1.id) ?? ids.count
                    return lhs < rhs
                }
        }
    }
    
    func character(id: Int) async throws -> Character {
        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character/\(id)")!)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Character.self, from: data)
    }
}
