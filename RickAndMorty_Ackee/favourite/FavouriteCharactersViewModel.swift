//
//  FavouriteCharactersViewModel.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation
import SwiftUI

class FavouriteCharactersViewModel: ObservableObject {
    typealias Dependencies = HasApiDependency
    
    @Published var isLoaded: Bool = false
    @Published var characters: [Character] = []
    
    let apiService: ApiServicing
    
    init(dependencies: Dependencies) {
        apiService = dependencies.apiService
    }
    
    @AppStorage("characters") var favoritesData: Data = Data()
    
    var favorites: [Int] {
        get {
            do {
                return try JSONDecoder().decode([Int].self, from: favoritesData)
            } catch {
                return []
            }
        }
        set {
            favoritesData = try! JSONEncoder().encode(newValue)
        }
    }
    
    @MainActor
    func fetchCharacters() async {
        guard !favorites.isEmpty else {return}
        characters = try! await apiService.getCharactersByID(ids: favorites)
        isLoaded = true
    }
}
