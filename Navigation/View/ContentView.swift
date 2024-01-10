//
//  ContentView.swift
//  Navigation
//
//  Created by Jan Janovec on 09.01.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tabCoordinator: TabCoordinator = .init()
    
    var tabSelectionBinding: Binding<MainTab> {
        Binding(get: {
            tabCoordinator.selectedTab
        }, set: { i in
            print(i)
            if true {
                tabCoordinator.selectedTab = i
            } else {
                // TODO: Pop to root
            }
        })
    }
    
    var body: some View {
        TabView(selection: tabSelectionBinding) {
            ForEach(MainTab.allCases) { tab in
                tab.view
                    .tag(tab)
                    .tabItem { Label(
                        title: { Text(tab.tabTitle) },
                        icon: { tab.tabImage }
                    ) }
            }
        }
        .environmentObject(tabCoordinator)
    }
}

#Preview {
    ContentView()
}
