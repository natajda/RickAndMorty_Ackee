//
//  CharactersViewModel.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

final class CharactersViewModel: ObservableObject {
    typealias Dependencies = HasApiDependency
    
    @Published var isLoaded: Bool = false
    @Published var characters: [Character] = []
    
    private var page = 1
    
    let apiService: ApiServicing
    
    init(dependencies: Dependencies) {
        apiService = dependencies.apiService
    }
    
    @MainActor
    func fetchFirstPage() async {
        page = 1
        characters = try! await apiService.getPage(page: page)
        isLoaded = true
    }
    
    @MainActor
    func fetchNextPage() async {
        page += 1
        let shows = try! await apiService.getPage(page: page)
        self.characters += shows
    }
}
