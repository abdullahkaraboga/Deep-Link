//
//  DeepLinkApp.swift
//  DeepLink
//
//  Created by Abdullah Karaboğa on 6.04.2023.
//

import SwiftUI

@main
struct DeepLinkApp: App {
    
    @StateObject private var appData : AppData = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
                .onOpenURL { url in
                    let string = url.absoluteString.replacingOccurrences(of: "app://", with: "")
                    let components = string.components(separatedBy: "?")
                    
                    for component in components {
                        if component.contains("tab=") {
                            let tabRawValue = component.replacingOccurrences(of: "tab=", with: "")
                            if let requestedTab = Tab.convert(from: tabRawValue){
                                appData.activeTab = requestedTab
                            }
                            print(tabRawValue)
                        }
                        
                        if components.contains("nav=") && string.contains("tab"){
                            
                            let requestedNavPath = component
                                .replacingOccurrences(of: "nav", with: "")
                                .replacingOccurrences(of: "_", with: " ")
                            
                            switch appData.activeTab {
                            case .home:
                                if let navPath = HomeStack.convert(from: requestedNavPath){
                                    appData.homeNavStack.append(navPath)
                                }
                            case .favorite:
                                if let navPath = FavoriteStack.convert(from: requestedNavPath){
                                    appData.favoriteNavStack.append(navPath)
                                }
                                
                            case .settings:
                                if let navPath = SettingsStack.convert(from: requestedNavPath){
                                    appData.settingsNavStack.append(navPath)
                                }
                            }
                            
                            
                        }
                    }
                }
        }
    }
}
