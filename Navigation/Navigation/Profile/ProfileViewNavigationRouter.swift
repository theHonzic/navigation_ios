//
//  ProfileViewNavigationRouter.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import SwiftUI

enum ProfileNavigationViewRouter: Routable {
    case photo
    case account
    case password
    case custom(value: String)
    
    var id: String {
        switch self {
        case .photo:
            "Photo"
        case .account:
            "Accont"
        case .password:
            "Password"
        case .custom(let value):
            "Custom \(value)"
        }
    }
    
    func view(coordinator: NavigationRouter<Self>) -> some View {
        VStack {
            NavigationLink("Account", value: Self.account)
            Button("Photo") {
                coordinator.navigate(to: .photo)
            }
            NavigationLink("Password", value: Self.password)
            NavigationLink("Custom", value: Self.custom(value: Date.now.ISO8601Format()))
            
            Button("Pop to root") {
                coordinator.popToRoot()
            }
            
            Button("Pop back") {
                coordinator.popBack()
            }
        }
        .navigationTitle(self.id)
        .navigationBarBackButtonHidden()
        .background {
            [Color.red, Color.yellow, .brown, .green, .cyan, .pink].randomElement()!.ignoresSafeArea()
        }
    }
}
