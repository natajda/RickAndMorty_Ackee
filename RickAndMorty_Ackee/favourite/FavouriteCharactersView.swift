//
//  FavouriteCharactersView.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation
import SwiftUI

struct FavouriteCharactersView: View {
    
    @ObservedObject var viewModel: FavouriteCharactersViewModel
    
    let onCharacterTapped: (Character) -> Void
    
    var body: some View {
        if (!viewModel.isLoaded) {
            ProgressView()
                .progressViewStyle(.circular)
                .task {
                    await viewModel.fetchCharacters()
                }
        } else {
            Group {
                if viewModel.characters.isEmpty {
//                    Text("No favorites yet").largeP().foregroundColor(Color("foregrounTertiary"))
                } else {
                    List(viewModel.characters) { ch in
                        // TODO: 
//                        Text(ch.character.name)
                    }
                }
            }
        }
    }
}
