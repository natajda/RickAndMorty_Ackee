//
//  CharactersView.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

import Foundation
import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel
    
    let onCharacterTapped: (Character) -> Void
    
    let onSearchTapped: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Characters").headline1().foregroundColor(Color("foregroundsPrimary"))
                .padding(.horizontal, 30)
                .frame(alignment: .leading)
            if (!viewModel.isLoaded) {
                ProgressView()
                    .frame(minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .center)
                    .progressViewStyle(.circular)
                    .task {
                        await viewModel.fetchFirstPage()
                    }
            } else {
                ScrollView {
                    Button {
                        onSearchTapped()
                    } label: {
                        ZStack(alignment: .top) {
                            Rectangle()
                                .frame(width: 343, height: 32)
                                .foregroundColor(Color("backgroundsSecondary"))
                                .cornerRadius(16)
                                .padding(.horizontal, 20)
                            
                            HStack(alignment: .center, spacing: 5) {
                                Image("search")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .frame(width: 24, height: 24, alignment: .trailing)
                                    .foregroundColor(Color("iconsPrimary"))
                                Text("Search character").mediumP().foregroundColor(Color("foregroundsSecondary"))
                                
                                Spacer()
                            }.padding(.horizontal, 30)
                                .padding(.top, 5)
                        }
                    }
                    LazyVStack {
                        ForEach(viewModel.characters) { character in
                            Button {
                                onCharacterTapped(character)
                            } label: {
                                CharacterListItemView(viewModel: CharacterListItemViewModel(character: character))
                            }
                        }
                        
                        ProgressView()
                            .onAppear {
                                Task {
                                    await viewModel.fetchNextPage()
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

