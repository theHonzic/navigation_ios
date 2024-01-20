//
//  GlobalSheetCoordinator.swift
//  Navigation
//
//  Created by Jan Janovec on 18.01.2024.
//

import Foundation
import JJNavigation
import SwiftUI

enum GlobalSheetCoordinator: SheetRoutable {
    case blue
    case red
    
    var id: String {
        switch self {
        case .blue:
            "blue"
        case .red:
            "red"
        }
    }
    
    func view(coordinator: SheetCoordinator<GlobalSheetCoordinator>) -> some View {
        switch self {
        case .blue:
            BlueView()
        case .red:
            RedView()
        }
    }
}
