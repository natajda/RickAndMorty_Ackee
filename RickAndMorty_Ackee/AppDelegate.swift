//
//  AppDelegate.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation
import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
