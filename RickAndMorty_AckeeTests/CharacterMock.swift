//
//  CharacterMock.swift
//  RickAndMorty_AckeeTests
//
//  Created by Natália Pohanková on 21/11/2023.
//

import Foundation

@testable import RickAndMorty_Ackee

extension Character {
    static var mockRick: Self {
        .init(id: 1,
              name: "Rick Sanchez",
              status: "Alive",
              type: "Human",
              species: "",
              image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
              gender: "Male",
              origin: Origin(name: "Earth (C-137)", url: ""),
              location: Location(name: "Citadel of Ricks", url: ""))
    }
    
    static var mockBeth: Self {
        .init(id: 4,
              name: "Beth Smith",
              status: "Alive",
              type: "",
              species: "Human",
              image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg",
              gender: "Female",
              origin: Origin(name: "Earth (Replacement Dimension)", url: ""),
              location: Location(name: "Earth (Replacement Dimension)", url: ""))
    }
}
