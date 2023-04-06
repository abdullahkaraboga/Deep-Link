//
//  Tab.swift
//  DeepLink
//
//  Created by Abdullah Karaboğa on 6.04.2023.
//

import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case favorite = "Favorites"
    case settings = "Settings"

    var symbolImage: String {
        switch self {
        case .home: return "house.fill"
        case .favorite: return "heart.fill"
        case .settings: return "gear"
        }
    }

    static func convert(from: String) -> Self? {
        return Tab.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
