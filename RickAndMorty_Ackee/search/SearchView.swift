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
    
    var body: some View {
        
        VStack {
            HStack(alignment: .center) {
                ZStack(alignment: .top) {
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
                    }.padding(.leading, 35)
                        .padding(.top, 5)
                }
                
                Button {
                    onCancelTapped()
                } label: {
                    Text("Cancel").mediumP().foregroundColor(Color("foregroundsPrimary"))
                    
                }.padding(.trailing, 10)
            }
            
            if !viewModel.characters.isEmpty {
                List(viewModel.characters) { ch in
                    //TODO: zobrazovanie
                }
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
