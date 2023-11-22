//
//  ApiServiceMock.swift
//  RickAndMorty_AckeeTests
//
//  Created by Natália Pohanková on 21/11/2023.
//

import Foundation

@testable import RickAndMorty_Ackee

final class ApiServiceMock: ApiServicing {
    
    var makeRequestResponse: [RickAndMorty_Ackee.Character]
    var getPageResponse: [RickAndMorty_Ackee.Character]
    var searchCharactersByNameResponse: [RickAndMorty_Ackee.Character]
    var getCharactersByIDResponse: [RickAndMorty_Ackee.Character]
    var characterResponse: RickAndMorty_Ackee.Character
    
    init(
        makeRequestResponse: [RickAndMorty_Ackee.Character] = .init(
            [.mockRick, .mockBeth]),
        getPageResponse: [RickAndMorty_Ackee.Character] = .init(
            [.mockRick, .mockBeth]),
        searchCharactersByNameResponse: [RickAndMorty_Ackee.Character] = .init(
            [.mockBeth]),
        getCharactersByIDResponse: [RickAndMorty_Ackee.Character] = .init(
            [.mockRick]),
        characterResponse: RickAndMorty_Ackee.Character = .mockRick) {
            self.makeRequestResponse = makeRequestResponse
            self.getPageResponse = getPageResponse
            self.searchCharactersByNameResponse = searchCharactersByNameResponse
            self.getCharactersByIDResponse = getCharactersByIDResponse
            self.characterResponse = characterResponse
        }
    
    func makeRequest(query: [URLQueryItem]) async throws -> [RickAndMorty_Ackee.Character] {
        makeRequestResponse
    }
    
    func getPage(page: Int) async throws -> [RickAndMorty_Ackee.Character] {
        getPageResponse
    }
    
    func searchCharactersByName(query: String, page: Int) async throws -> [RickAndMorty_Ackee.Character] {
        searchCharactersByNameResponse
    }
    
    func getCharactersByID(ids: [Int]) async throws -> [RickAndMorty_Ackee.Character] {
        getCharactersByIDResponse
    }
    
    func character(id: Int) async throws -> RickAndMorty_Ackee.Character {
        characterResponse
    }
}
