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
    
    var body: some View {
        
        VStack {
            //TODO: lupa, xko, cancel, format pekny toho tada okienka
            Image("search")
            TextField(text: Binding(
                get: { viewModel.searchText },
                set: { text in
                    viewModel.searchTextChanged(text)
                }
            )) {
                Text("Search character").mediumP().foregroundColor(Color("foregroundsSecondary"))
            }
            .padding(.horizontal)
            
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
