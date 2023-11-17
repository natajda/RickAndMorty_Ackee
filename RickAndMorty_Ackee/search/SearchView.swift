//
//  SearchView.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation
import SwiftUI


struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    let onCancelTapped: () -> Void
    
    let onCharacterTapped: (Character) -> Void
    
    var body: some View {
        
        VStack {
            HStack(alignment: .center) {
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .frame(width: 300, height: 32)
                        .foregroundColor(Color("backgroundsSecondary"))
                        .cornerRadius(16)
                        .padding(.leading, 20)
                    
                    HStack(alignment: .center, spacing: 5) {
                        Image("search")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .trailing)
                            .foregroundColor(Color("iconsPrimary"))
                        TextField(text: Binding(
                            get: { viewModel.searchText },
                            set: { text in
                                viewModel.searchTextChanged(text)
                            }
                        )) {
                            Text("Search character").mediumP().foregroundColor(Color("foregroundsSecondary"))
                        }
                        Spacer()
                        
                        if (!viewModel.searchText.isEmpty) {
                            Button {
                                viewModel.searchTextChanged("")
                            } label: {
                                Image("favorites_x-circle")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .frame(width: 16, height: 16, alignment: .trailing)
                                    .foregroundColor(Color("iconsPrimary"))
                            }.padding(.trailing, 7)
                        }
                    }.padding(.leading, 25)
                        .padding(.top, 5)
                }
                
                Button {
                    onCancelTapped()
                } label: {
                    Text("Cancel").mediumP().foregroundColor(Color("foregroundsPrimary"))
                    
                }.padding(.trailing, 15)
            }.background(Color("backgroundsPrimary"))
            
            if !viewModel.characters.isEmpty {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.characters) { ch in
                            Button {
                                onCharacterTapped(ch)
                            } label: {
                                CharacterListItemView(viewModel: CharacterListItemViewModel(character: ch))
                            }
                        }
                        
                        if (!viewModel.allDisplayed) {
                            ProgressView()
                                .onAppear {
                                    Task {
                                        await viewModel.fetchNextPage()
                                    }
                                }
                        }
                    }
                }
            } else if (viewModel.characters.isEmpty && !viewModel.searchText.isEmpty) {
                VStack(alignment: .center) {
                    Text("No character found.").largeP().foregroundColor(Color("foregroundsTertiary"))
                }.background(Color("backgroundsPrimary"))
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: .infinity,
                           alignment: .center)
            }
            
            Spacer()
        }.background(Color("backgroundsPrimary"))
    }
}
