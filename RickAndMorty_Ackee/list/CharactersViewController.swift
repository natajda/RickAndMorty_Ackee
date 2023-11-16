//
//  CharactersViewController.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 15/11/2023.
//

import UIKit
import SwiftUI

final class CharactersViewController: UIViewController {
    private let viewModel = CharactersViewModel(dependencies: appDependencies)
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(named: "backgroundsPrimary")
        
        let rootView = CharactersView(viewModel: self.viewModel,
                                      onCharacterTapped: { [weak self] character in
            self?.onCharacterTapped(character)
        }, onSearchTapped: {self.onSearchTapped()})
        
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    private func onCharacterTapped(_ ch: Character) {
        let vc = CharacterDetailViewController(viewModel: CharacterDetailViewModel(character: ch))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func onSearchTapped() {        
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
