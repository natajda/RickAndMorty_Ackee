//
//  CharacterDetailView.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation
import SwiftUI

struct CharacterDetailView: View {
    
    @ObservedObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color("backgroundsTertiary"))
                .frame(width: 343, height: 473)
                .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0, y: 0)
            
            VStack(alignment: .center) {
                HStack(alignment: .top) {
                    //                    Image(viewModel.character.name)
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .frame(width: 140, height: 140)
                    //                        .cornerRadius(10)
                    //                        .padding()
                    
                    AsyncImage(url: URL(string: viewModel.character.image)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                        
                    }.frame(width: 140, height: 140)
                        .cornerRadius(10)
                        .padding()
                    
                    
                    VStack(alignment: .leading) {
                        Text("Name").mediumP().foregroundColor(Color("foregroundsSecondary"))
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 10))
                        Text(viewModel.character.name).headline2().foregroundColor(Color("foregroundsPrimary"))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                    }
                    Spacer()
                    Button {
                        viewModel.toggleFavorites()
                    } label: {
                        Image(viewModel.isFavorite ? "favorites_active_detail" : "favorites_inactive_detail").foregroundColor(.accentColor)
                    }.padding()
                }
                .frame(width: 343)
                
                Divider().frame(width: 343)
                
                VStack(alignment: .leading) {
                    InfoView(text: "Status", value: viewModel.character.status)
                    InfoView(text: "Species", value: viewModel.character.species)
                    InfoView(text: "Type", value: viewModel.character.type)
                    InfoView(text: "Gender", value: viewModel.character.gender)
                    InfoView(text: "Origin", value: viewModel.character.origin.name)
                    InfoView(text: "Location", value: viewModel.character.location.name)
                    Spacer()
                }.frame(width: 343)
                Spacer()
            }
        }
    }
    
    
    func InfoView(text: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(text).smallP().foregroundColor(Color("foregroundsSecondary")).frame(width: 60, alignment: .leading)
                .padding(.leading, 20)
            Spacer()
            Text(value).headline3().foregroundColor(Color("foregroundsPrimary")).frame(width: 200, alignment: .leading)
                .lineLimit(3)
        }.padding(.vertical, 5)
    }
}

