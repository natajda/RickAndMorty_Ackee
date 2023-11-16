//
//  CharacterDetailViewController.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

import Foundation

import UIKit
import SwiftUI

final class CharacterDetailViewController: UIViewController {
    
    private let viewModel: CharacterDetailViewModel
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        let rootView = CharacterDetailView(viewModel: self.viewModel, onBackTapped: {self.onBackTapped()})
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    func onBackTapped() {
        navigationController?.popViewController(animated: true)
    }
}
