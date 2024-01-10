//
//  Routable.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import SwiftUI

protocol Routable: Identifiable, Hashable {
    associatedtype Body: View

    @ViewBuilder
    func view(coordinator: NavigationRouter<Self>) -> Body
}
