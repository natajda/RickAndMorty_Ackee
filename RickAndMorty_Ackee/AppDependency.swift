//
//  AppDependency.swift
//  Rick_Morty_Ackee
//
//  Created by Natália Pohanková on 14/11/2023.
//

import Foundation

import Foundation

let appDependencies = AppDependency()

final class AppDependency {
    lazy var apiService: ApiServicing = ApiService()
}

protocol HasNoDependency {}

extension AppDependency: HasApiDependency {}
