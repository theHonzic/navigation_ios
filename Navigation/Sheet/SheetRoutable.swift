//
//  SheetRoutable.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import SwiftUI

protocol SheetRoutable: Identifiable {
    associatedtype Body: View

    @ViewBuilder
    func view(coordinator: SheetCoordinator<Self>) -> Body
}
