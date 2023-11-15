//
//  FavouriteCharactersViewModel.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

class FavouriteCharactersViewModel: ObservableObject {
    typealias Dependencies = HasApiDependency
    
    @Published var isLoaded: Bool = false
    @Published var characters: [SearchedCharacter] = []
    
    let apiService: ApiServicing
    
    init(dependencies: Dependencies) {
        apiService = dependencies.apiService
    }
    
    var ids: [Int] {
        UserDefaults.standard.value(forKey: "characters") as? [Int] ?? []
    }
    
    @MainActor
    func fetchCharacters() async {
        guard !ids.isEmpty else { return }
        characters = try! await apiService.getCharactersByID(ids: ids)
    }
}
