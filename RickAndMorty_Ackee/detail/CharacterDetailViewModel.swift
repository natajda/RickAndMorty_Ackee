//
//  CharacterDetailViewModel.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var isFavorite = false
    
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    func toggleFavorites() {
        var characters = UserDefaults.standard.value(forKey: "characters") as? [Int] ?? []
        if characters.contains(character.id) {
            characters.removeAll { $0 == character.id }
        } else {
            characters.append(character.id)
        }
        UserDefaults.standard.setValue(characters, forKey: "characters")
        checkFavorites()
    }
    
    func checkFavorites() {
        let characters = UserDefaults.standard.value(forKey: "characters") as? [Int] ?? []
        isFavorite = characters.contains(character.id)
    }
}
