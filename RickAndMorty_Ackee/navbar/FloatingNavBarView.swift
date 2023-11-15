//
//  FloatingNavBarViewController.swift
//  RickAndMorty_Ackee
//
//  Created by Natália Pohanková on 15/11/2023.
//

import UIKit

class FloatingNavBarViewController: UINavigationBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        // Set the desired width and height
        let barWidth: CGFloat = 182.0
        let barHeight: CGFloat = 62.0
        
        // Set the background color to pink
//        barTintColor = UIColor(named: "bottomNavigation")
        barTintColor = UIColor(.pink)
        
        // Set the frame size
        frame.size = CGSize(width: barWidth, height: barHeight)
        
        // Center the navigation bar
        center = CGPoint(x: UIScreen.main.bounds.width / 2.0, y: barHeight / 2.0)
        
        // Make the navigation bar rounded
        layer.masksToBounds = false
        layer.cornerRadius = barHeight / 2.0
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.16
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 16
    }
}
