//
//  MainTab.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import SwiftUI

enum MainTab: String, Identifiable, CaseIterable {
    case home
    case explore
    case tickets
    case payments
    case profile
    
    var id: String { self.rawValue }
    
    var tabTitle: String {
        self.rawValue
    }
    
    var tabImage: Image {
        Image(systemName: "42.circle")
    }
    
    @ViewBuilder var view: some View {
        switch self {
        case .home:
            HomeView()
        case .explore:
            ExploreView()
        case .tickets:
            TicketsView()
        case .payments:
            PaymentsView()
        case .profile:
            ProfileView()
        }
    }
}
