//
//  Home.swift
//  DeepLink
//
//  Created by Abdullah Karaboğa on 7.04.2023.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var appData: AppData
    var body: some View {
        TabView(selection:$appData.activeTab) {
            
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Image(systemName: Tab.home.symbolImage)
                }
            
            FavoriteView()
                .tag(Tab.favorite)
                .tabItem {
                    Image(systemName: Tab.favorite.symbolImage)
                }
            
            FavoriteView()
                .tag(Tab.settings)
                .tabItem {
                    Image(systemName: Tab.settings.symbolImage)
                }
            
        }.tint(.red)
    }
    
    @ViewBuilder
    func HomeView() -> some View {
        NavigationStack(path:$appData.homeNavStack) {
            List {
                
                ForEach(HomeStack.allCases,id: \.rawValue) { link in
                    NavigationLink(value: link){
                        Text(link.rawValue)
                    }
                }
                
            }
            .navigationTitle("Home")
            .navigationDestination(for: HomeStack.self) { link in
                Text(link.rawValue + " View")
            }
        }
    }
    
    @ViewBuilder
    func FavoriteView() -> some View {
        NavigationStack(path:$appData.favoriteNavStack) {
            List {
                
                ForEach(HomeStack.allCases,id: \.rawValue) { link in
                    NavigationLink(value: link){
                        Text(link.rawValue)
                    }
                }
                
            }
            .navigationTitle("Favorite's")
            .navigationDestination(for: FavoriteStack.self) { link in
                Text(link.rawValue + " View")
            }
        }
    }
    
    @ViewBuilder
    func SettingsView() -> some View {
        NavigationStack (path:$appData.settingsNavStack){
            List {
                
                ForEach(SettingsStack.allCases,id: \.rawValue) { link in
                    NavigationLink(value: link){
                        Text(link.rawValue)
                    }
                }
                
            }
            .navigationTitle("Settings")
            .navigationDestination(for: SettingsStack.self) { link in
                Text(link.rawValue + " View")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData())
    }
}
