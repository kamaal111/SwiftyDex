//
//  Navigator.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 11/06/2022.
//

import SwiftUI

final class Navigator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selection: Screens? = .pokedex {
        didSet { path.removeLast(path.count) }
    }

    init() { }

    enum Screens: Hashable, CaseIterable {
        case pokedex

        var title: String {
            switch self {
            case .pokedex:
                return "Pokedex"
            }
        }

        var icon: String {
            switch self {
            case .pokedex:
                return "platter.filled.top.iphone"
            }
        }
    }
}
