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
    
    var body: some View {
        //TODO: search bar, navigation
        
        Text("Characters").headline1().foregroundColor(Color("foregroundsPrimary"))
        
        if (!viewModel.isLoaded) {
            ProgressView()
                .progressViewStyle(.circular)
                .task {
                    await viewModel.fetchFirstPage()
                }
        } else {
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.characters) { character in
                        
                        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color("backgroundsTertiary"))
                                    .frame(width: 343, height: 60)
                                    .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0, y: 0)
                                
                                HStack {
                                    AsyncImage(url: URL(string: character.image)!) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        ProgressView()
                                            .progressViewStyle(.circular)
                                        
                                    }.frame(width: 44, height: 44)
                                        .cornerRadius(10)
                                    
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        HStack(alignment: .center, spacing: 3) {
                                            Text(character.name)
                                                .headline3()
                                                .foregroundColor(Color(("foregroundsPrimary")))
                                                .padding(.horizontal, 2)
                                            
                                            Image(viewModel.checkIsFavorite(id: character.id) ? "favorites_active_detail" : "favorites_inactive_detail")
                                                .resizable()
                                                .frame(width: 16, height: 16).foregroundColor(.accentColor)
                                            
                                        }
                                        Text(character.status)
                                            .smallP()
                                            .foregroundColor(Color("foregroundsSecondary"))
                                    }
                                    
                                    Spacer()
                                    Image("arrow_right")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 23, height: 24, alignment: .trailing)
                                }
                                .padding(.horizontal, 30)
                            }
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
        
    }
}
