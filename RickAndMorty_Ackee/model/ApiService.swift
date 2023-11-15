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
    func makeRequest(path: String, query: [URLQueryItem]) async throws -> [SearchedCharacter]
    func getPage(page: Int) async throws -> [SearchedCharacter]
    func searchCharactersByName(query: String) async throws -> [SearchedCharacter]
    func getCharactersByID(ids: [Int]) async throws -> [SearchedCharacter]
    func character(id: Int) async throws -> SearchedCharacter
}


final class ApiService: ApiServicing {
    
    func makeRequest(path: String = "", query: [URLQueryItem] = []) async throws -> [SearchedCharacter] {
        var components = URLComponents(
            url: URL(string: "https://rickandmortyapi.com/api/character\(path)")!,
            resolvingAgainstBaseURL: false
        )
        if !query.isEmpty {
            components?.queryItems = query
        }
        
        guard let url = components?.url else { throw InvalidURL() }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoded = try JSONDecoder().decode(ApiResponse.self, from: data)
        return decoded.results
    }
    
    func getPage(page: Int = 1) async throws -> [SearchedCharacter] {
        let query = page > 1 ? [URLQueryItem(name: "page", value: String(page))] : []
        return try await makeRequest(query: query)
    }
    
    func searchCharactersByName(query: String) async throws -> [SearchedCharacter] {
        let queryItems: [URLQueryItem] = [
            .init(name: "name", value: query)
        ]
        return try await makeRequest(query: queryItems)
    }
    
    func getCharactersByID(ids: [Int]) async throws -> [SearchedCharacter] {
        try await withThrowingTaskGroup(of: SearchedCharacter.self) { group in
            var characters: [SearchedCharacter] = []
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
    
    
    func character(id: Int) async throws -> SearchedCharacter {
        let characters: [SearchedCharacter] = try await makeRequest(path: "/\(id)")
        if let ch = characters.first {
            return ch
        } else {
            throw CharacterNotExistend(id: id)
        }
    }
}
