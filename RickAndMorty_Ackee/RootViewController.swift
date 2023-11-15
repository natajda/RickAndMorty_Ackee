//
//  RootViewController.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation
import UIKit
import SwiftUI

class RootViewController: UIViewController {
    private weak var tabBar: UITabBarController!
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(named: "backgroundsPrimary")
    
        let charactersViewController = CharactersViewController()
        let charactersNavigationController = UINavigationController(rootViewController: charactersViewController)
        charactersNavigationController.tabBarItem.image = UIImage(named: "characters_inactive")
               
        let favouritesViewController = FavouriteCharactersViewController()
        let favouritesNavigationController = UINavigationController(rootViewController: favouritesViewController)
        favouritesNavigationController.tabBarItem.image = UIImage(named: "favorites_inactive_nav")
        
        let tabBarController = FloatingNavBarViewController()
        tabBarController.viewControllers = [charactersNavigationController, favouritesNavigationController]
        embedController(tabBarController)
        self.tabBar = tabBarController
    }
    
}
