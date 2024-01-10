//
//  TabCoordinator.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import SwiftUI

final class TabCoordinator: ObservableObject {
    @Published var selectedTab: MainTab = .home
    
    func switchTab(_ tab: MainTab) {
        self.selectedTab = tab
    }
}
