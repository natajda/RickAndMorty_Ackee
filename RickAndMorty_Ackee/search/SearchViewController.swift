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

        let rootView = SearchView(viewModel: self.viewModel, onCancelTapped: {self.onCancelTapped()})
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func onCancelTapped() {
        navigationController?.popViewController(animated: true)
    }
}
