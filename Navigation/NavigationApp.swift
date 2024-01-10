//
//  NavigationApp.swift
//  Navigation
//
//  Created by Jan Janovec on 09.01.2024.
//

import SwiftUI

@main
struct NavigationApp: App {
    init() {
        configureTabBarAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#Preview(body: {
    ContentView()
})

// MARK: - Appearance
extension NavigationApp {
    private func configureTabBarAppearance() {
        let appearance: UITabBarAppearance = {
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.green]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red]
            appearance.stackedLayoutAppearance.normal.iconColor = .green
            appearance.stackedLayoutAppearance.selected.iconColor = .red
            return appearance
        }()
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    private func configureNavigationBarAppearance() {
        let appearance: UINavigationBarAppearance = {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .clear
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.red
            ]
            appearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor.systemPink
            ]
            return appearance
        }()
        UINavigationBar.appearance().compactAppearance = appearance
        
        let standardAppearance = appearance.copy()
        standardAppearance.configureWithDefaultBackground()
        standardAppearance.backgroundColor = .clear
        
        UINavigationBar.appearance().standardAppearance = standardAppearance
        
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().tintColor = .systemPink
    }
}
