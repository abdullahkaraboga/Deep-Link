//
//  HomeStack.swift
//  DeepLink
//
//  Created by Abdullah Karaboğa on 6.04.2023.
//

import SwiftUI

enum HomeStack : String, CaseIterable {
    case myPost = "My Posts"
    case oldPost = "Old Posts"
    case latestPost = "Latest Posts"
    case deletedPost = "Deleted Posts"
    
    static func convert(from: String)-> Self? {
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
