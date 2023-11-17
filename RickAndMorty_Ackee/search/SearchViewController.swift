//
//  SearchViewController.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import UIKit
import SwiftUI

final class SearchViewController: UIViewController {
    private let viewModel = SearchViewModel(dependencies: appDependencies)
    
    override func loadView() {
        super.loadView()
        
        let rootView = SearchView(viewModel: self.viewModel, onCancelTapped: {self.onCancelTapped()},
                                  onCharacterTapped: { [weak self] character in
            self?.onCharacterTapped(character)
        })
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    private func onCharacterTapped(_ ch: Character) {
        let vc = CharacterDetailViewController(viewModel: CharacterDetailViewModel(character: ch))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func onCancelTapped() {
        navigationController?.popViewController(animated: true)
    }
}
