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
    
    var searchText = ""
    
    private var searchTask: Task<Void, Error>?
    
    let apiService: ApiServicing
    
    init(dependencies: Dependencies) {
        apiService = dependencies.apiService
    }
    
    func searchTextChanged(_ text: String) {
        searchText = text
        searchTask?.cancel()
        searchTask = Task {
            try await Task.sleep(for: .seconds(0.3))
            await self.fetchCharacters(query: text)
        }
    }
    
    @MainActor
    private func fetchCharacters(query: String) async {
        do {
            characters = try await apiService.searchCharactersByName(query: query)
        } catch {
            // Skip if the status of the task is cancelled (-999)
            guard (error as NSError).code != -999 else { return }
            print("[ERROR]", error.localizedDescription)
        }
    }
}
