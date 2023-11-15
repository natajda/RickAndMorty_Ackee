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
        
        let rootView = CharactersView(viewModel: self.viewModel)
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
//    @objc
//    private func searchTapped() {
//        let vc = SearchViewController()
//        let navVC = UINavigationController(rootViewController: vc)
//        present(navVC, animated: true)
//    }
//}
