//
//  WrapContentSheet.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import SwiftUI

struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}

private struct ReadHeightModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }

    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

extension View {
    func readHeight() -> some View {
        self
            .modifier(ReadHeightModifier())
    }
}

struct WrapContentSheetView<Content: View>: View {
    @State var presentSheet: Bool = false
    @State var detentHeight: CGFloat = 0
    @ViewBuilder let content: Content
    
    var body: some View {
        Button("Tap me") {
            self.presentSheet.toggle()
        }
        .sheet(isPresented: self.$presentSheet) {
            content
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    if let height {
                        self.detentHeight = height
                    }
                }
                .presentationDetents([.height(self.detentHeight)])
        }
    }
}
