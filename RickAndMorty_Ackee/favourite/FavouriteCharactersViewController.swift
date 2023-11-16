//
//  FavouriteCharactersViewController.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

import UIKit
import SwiftUI

final class FavouriteCharactersViewController: UIViewController {
    private let viewModel = FavouriteCharactersViewModel(dependencies: appDependencies)
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(named: "backgroundsPrimary")
        
        let rootView = FavouriteCharactersView(
            viewModel: self.viewModel, onCharacterTapped: { [weak self] character in
                self?.onCharacterTapped(character)
            }
        )
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
     }
    
    
    private func onCharacterTapped(_ character: Character) {
        let vc = CharacterDetailViewController(viewModel:
                                                CharacterDetailViewModel(character: character))
        navigationController?.pushViewController(vc, animated: true)
    }
}
