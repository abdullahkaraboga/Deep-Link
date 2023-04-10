//
//  AppData.swift
//  DeepLink
//
//  Created by Abdullah Karaboğa on 7.04.2023.
//

import SwiftUI

class AppData: ObservableObject {
    @Published var activeTab : Tab = .home
    @Published var homeNavStack : [HomeStack] = []
    @Published var favoriteNavStack : [FavoriteStack] = []
    @Published var settingsNavStack : [SettingsStack] = []
    
}
