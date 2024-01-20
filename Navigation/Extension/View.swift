//
//  View.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import SwiftUI

extension View {
    func navigating<Router: Routable>(in router: NavigationRouter<Router>) -> some View {
        modifier(CustomNavigation<Router>())
            .environmentObject(router)
    }
}

struct CustomNavigation<Router: Routable>: ViewModifier {
    @EnvironmentObject var coordinator: NavigationRouter<Router>
    func body(content: Content) -> some View {
        NavigationStack(path: $coordinator.stack) {
            content
                .navigationDestination(for: Router.self, destination: { destination in
                    destination.view(coordinator: coordinator)
                })
        }
    }
}

struct SheetCoordinating<Sheet: SheetRoutable>: ViewModifier {
    @StateObject var coordinator: SheetCoordinator<Sheet>

    func body(content: Content) -> some View {
        content
            .sheet(item: $coordinator.currentSheet, onDismiss: {
                coordinator.sheetDismissed()
            }, content: { sheet in
                sheet.view(coordinator: coordinator)
            })
    }
}

extension View {
    func sheetCoordinating<Sheet: SheetRoutable>(coordinator: SheetCoordinator<Sheet>) -> some View {
        modifier(SheetCoordinating(coordinator: coordinator))
            .environmentObject(coordinator)
    }
}
