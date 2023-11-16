//
//  CharacterListItemView.swift
//  RickAndMorty_Ackee
//
//  Created by Natália Pohanková on 16/11/2023.
//

import Foundation
import SwiftUI

struct CharacterListItemView: View {
    
    @ObservedObject var viewModel: CharacterListItemViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color("backgroundsTertiary"))
                .frame(width: 343, height: 60)
                .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0, y: 0)
            
            HStack {
                AsyncImage(url: URL(string: viewModel.character.image)!) { phase in
                    if let image = phase.image  {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        Image(systemName: "exclamationmark.triangle").padding()
                    } else {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                }.frame(width: 44, height: 44)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .center, spacing: 3) {
                        Text(viewModel.character.name)
                            .headline3()
                            .foregroundColor(Color(("foregroundsPrimary")))
                            .padding(.horizontal, 2)
                        
                        Image(viewModel.checkIsFavorite() ? "favorites_active_detail" : "favorites_inactive_detail")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("iconsTertiary"))
                            .frame(width: 16, height: 16)
                        
                    }
                    Text(viewModel.character.status)
                        .smallP()
                        .foregroundColor(Color("foregroundsSecondary"))
                }
                
                Spacer()
                Image("arrow_right")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 23, height: 24, alignment: .trailing)
                    .foregroundColor(Color("iconsPrimary"))
            }
            .padding(.horizontal, 30)
        }
    }
}
