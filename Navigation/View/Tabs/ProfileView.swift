//
//  ProfileView.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import JJNavigation
import SwiftUI

struct ProfileView: View {
    @StateObject private var coordinator: NavigationRouter<ProfileNavigationViewRouter> = .init()
    @State var slider: Double = 0
    var body: some View {
        Button("Account") {
            coordinator.navigate(to: .account)
        }
        .navigating(in: coordinator)
    }
}
