//
//  TextStyles.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 10/11/2023.
//

import Foundation
import SwiftUI

extension Text {
    func headline1() -> some View {
        self
            .font(.custom("Inter-Regular", size: 28))
            .fontWeight(.bold)
            .tracking(0.0)
    }
    
    func headline2() -> some View {
        self
            .font(.custom("Inter-Regular", size: 20))
            .fontWeight(.bold)
            .tracking(0.0)
    }
    
    func headline3() -> some View {
        self
            .font(.custom("Inter-Regular", size: 16))
            .fontWeight(.bold)
            .tracking(0.0)
    }
    
    func largeP() -> some View {
        self
            .font(.custom("Inter-Regular", size: 18))
            .tracking(0.0)
        
    }
    
    func mediumP() -> some View {
        self
            .font(.custom("Inter-Regular", size: 16))
            .tracking(0.0)
        
    }
    
    func smallP() -> some View {
        self
            .font(.custom("Inter-Regular", size: 14))
            .tracking(0.0)
        
    }
    
    func bottomNavigation() -> some View {
        self
            .font(.custom("Inter-Regular", size: 12))
            .tracking(0.0)
        
    }
}
