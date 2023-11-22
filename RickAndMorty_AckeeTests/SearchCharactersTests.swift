//
//  SearchCharactersTests.swift
//  SearchCharactersTests
//
//  Created by Natália Pohanková on 21/11/2023.
//

import XCTest

@testable import RickAndMorty_Ackee

final class SearchCharactersTests: XCTestCase {
    private struct Dependencies: SearchViewModel.Dependencies {
        var apiService: ApiServicing
    }
    
    private var apiService: ApiServiceMock!
    private var dependencies: Dependencies!
    
    override func setUpWithError() throws {
        apiService = ApiServiceMock.init()
        dependencies = .init(apiService: apiService)
    }
    
    override func tearDownWithError() throws {
        //
    }
    
    func testCharactersSearchFetch() async throws {
        let searchVM = SearchViewModel(dependencies: dependencies)
        
        XCTAssertTrue(searchVM.characters.isEmpty)
        
        await searchVM.fetchNextPage()
        
        XCTAssertTrue(searchVM.characters.count == 1)
    }
    
    func testCharactersSearchCorrectValues() async throws {
        let searchVM = SearchViewModel(dependencies: dependencies)
        
        let searchCharacterMock: Character = .mockBeth
                
        await searchVM.fetchNextPage()
                
        XCTAssertTrue(searchVM.characters.contains(searchCharacterMock))
    }
}
