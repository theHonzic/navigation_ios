//
//  TicketsView.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import JJNavigation
import SwiftUI

struct TicketsView: View {
    @StateObject var globalSheetCoordinator: SheetCoordinator<GlobalSheetCoordinator> = .init()
    var body: some View {
        Text("Tickets view")
            .onTapGesture {
                globalSheetCoordinator.presentSheet(.blue)
            }
            .sheetCoordinating(coordinator: globalSheetCoordinator)
    }
}

struct BlueView: View {
    @EnvironmentObject var coordinator: SheetCoordinator<GlobalSheetCoordinator>
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Color.blue
            .onTapGesture {
                dismiss()
                coordinator.presentSheet(.red)
            }
    }
}

struct RedView: View {
    @EnvironmentObject var coordinator: SheetCoordinator<GlobalSheetCoordinator>
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Color.red
            .onTapGesture {
                dismiss()
                coordinator.presentSheet(.blue)
            }
    }
}
