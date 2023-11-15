//
//  Character.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 10/11/2023.
//

import Foundation

struct Character: Hashable, Codable {
    var id: Int
    var name: String
    var status : String
    var type: String = "-"
    var species: String
    var image: String
    
    var gender: String
    var origin: Origin
    var location: Location
    
}

struct Origin: Hashable, Codable {
    var name : String
    var url: String
}

struct Location: Hashable, Codable {
    var name : String
    var url: String
}

extension Character: Identifiable {
    
}
