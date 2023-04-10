//
//  FavoriteStack.swift
//  DeepLink
//
//  Created by Abdullah Karaboğa on 6.04.2023.
//

import SwiftUI

enum FavoriteStack : String, CaseIterable {
    case user1 = "User 1"
    case user2 = "User 2"
    case user3 = "User 3"

    
    static func convert(from: String)-> Self? {
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
