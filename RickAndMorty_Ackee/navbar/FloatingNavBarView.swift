//
//  FloatingNavBarView.swift
//  RickAndMorty_Ackee
//
//  Created by Natália Pohanková on 15/11/2023.
//
import UIKit

class FloatingNavBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layer = CAShapeLayer()
        let barWidth: CGFloat = 182.0
        let barHeight: CGFloat = 62.0

        layer.path = UIBezierPath(
            roundedRect: CGRect(
                x: UIScreen.main.bounds.width / 2.0, y: barHeight / 2.0, width: barWidth, height: barHeight),
            cornerRadius: (barHeight/2)).cgPath

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 16.0
        layer.shadowOpacity = 0.16
        layer.fillColor = UIColor(named: "bottomNavigation")?.cgColor

        tabBar.layer.insertSublayer(layer, at: 0)

        if let items = tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
            }
        }
        tabBar.itemWidth = 30.0
        tabBar.itemPositioning = .centered
    }
}
