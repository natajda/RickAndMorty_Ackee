//
//  CharacterListItemViewModel.swift
//  RickAndMorty_Ackee
//
//  Created by Natália Pohanková on 16/11/2023.
//

import Foundation
import SwiftUI

class CharacterListItemViewModel: ObservableObject {
    let character: Character
    
    //duplicated 
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
    
    init(character: Character) {
        self.character = character
    }
    
    func checkIsFavorite() -> Bool {
        return favorites.contains(character.id)
    }
}
