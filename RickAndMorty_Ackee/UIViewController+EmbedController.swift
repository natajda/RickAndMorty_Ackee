//
//  UIViewController+EmbedController.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

import UIKit

extension UIViewController {
    /// Adds given `UIViewController` to the view controller's hierarchy.
    ///
    /// It layouts the given `vc`'s view to the edges of the current view controller.
    func embedController(_ vc: UIViewController) {
        addChild(vc)
        view.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vc.view!.topAnchor.constraint(equalTo: view.topAnchor),
            vc.view!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vc.view!.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            vc.view!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        vc.didMove(toParent: self)
    }
}
