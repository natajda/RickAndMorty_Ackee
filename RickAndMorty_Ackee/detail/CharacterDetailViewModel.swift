//
//  CharacterDetailViewModel.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation
import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published var isFavorite = false
    
    @AppStorage("characters") var favoritesData: Data = Data()
    
    let character: Character
    
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
    
    init(character: Character) {
        self.character = character
        checkFavorites()
    }
    
    func toggleFavorites() {
        if favorites.contains(character.id) {
            favorites.removeAll { $0 == character.id }
        } else {
            favorites.append(character.id)
        }
        checkFavorites()
    }
    
    func checkFavorites() {
        isFavorite = favorites.contains(character.id)
    }
}
