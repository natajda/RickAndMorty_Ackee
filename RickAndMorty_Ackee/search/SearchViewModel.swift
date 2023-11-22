//
//  SearchViewModel.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

final class SearchViewModel: ObservableObject {
    typealias Dependencies = HasApiDependency
    
    @Published var characters: [Character] = []
    
    @Published var allDisplayed: Bool = false
    
    var searchText = ""
    
    private var page = 1
    
    private var searchTask: Task<Void, Error>?
    
    let apiService: ApiServicing
    
    init(dependencies: Dependencies) {
        apiService = dependencies.apiService
    }
    
    func searchTextChanged(_ text: String) {
        searchText = text
        guard text != "" else { characters = []; return }
        searchTask?.cancel()
        searchTask = Task {
            try await Task.sleep(for: .seconds(0.3))
            await self.fetchCharacters(query: text)
            page = 1
        }
    }
    
    @MainActor
    private func fetchCharacters(query: String) async {
        do {
            characters = try await apiService.searchCharactersByName(query: query, page: 1)
            allDisplayed = false
        } catch {
            // Skip if the status of the task is cancelled (-999)
            guard (error as NSError).code != -999 else { return }
            print("[ERROR]", error.localizedDescription)
        }
    }
    
    @MainActor
    func fetchNextPage() async {
        page += 1
        
        do {
            let new = try await apiService.searchCharactersByName(query: searchText, page: page)
            self.characters += new
            
            if (new.isEmpty) {
                allDisplayed = true
            }
        } catch {
            // Skip if the status of the task is cancelled (-999)
            guard (error as NSError).code != -999 else { return }
            print("[ERROR]", error.localizedDescription)
        } 
    }
}
