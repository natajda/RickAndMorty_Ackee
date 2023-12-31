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
        VStack(alignment: .leading) {
            Text("Favorites").headline1().foregroundColor(Color("foregroundsPrimary"))
                .padding(.horizontal, 20)
                .frame(alignment: .leading)
            if (!viewModel.isLoaded && !viewModel.favorites.isEmpty) {
                ProgressView()
                    .progressViewStyle(.circular)
                    .task {
                        await viewModel.fetchCharacters()
                    }
            } else {
                Group {
                    if viewModel.favorites.isEmpty {
                        VStack(alignment: .center) {
                            Text("No favorites yet").largeP().foregroundColor(Color("foregroundsTertiary"))
                        }.background(Color("backgroundsPrimary"))
                            .frame(minWidth: 0,
                                   maxWidth: .infinity,
                                   minHeight: 0,
                                   maxHeight: .infinity,
                                   alignment: .center)
                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.characters) { character in
                                    Button {
                                        onCharacterTapped(character)
                                    } label: {
                                        CharacterListItemView(viewModel: CharacterListItemViewModel(character: character))
                                    }
                                }
                            }
                        }.onAppear {
                            Task {
                                await viewModel.fetchCharacters()
                            }
                        }
                    }
                }
            }
            Spacer()
        }.background(Color("backgroundsPrimary"))
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .topLeading)
        
    }
}
