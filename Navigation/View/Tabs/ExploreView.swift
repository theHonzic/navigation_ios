//
//  ExploreView.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import SwiftUI

struct ExploreView: View {
    @State var colors: [Color] = [
        Color.red,
        .orange,
        .yellow,
        .green,
        .blue,
        .purple,
        .pink,
        .black,
        .brown,
        .cyan,
        .mint,
        .indigo,
        .teal
    ]
    
    var body: some View {
        List(content: {
            ForEach(0..<100) { _ in
                colors.randomElement()!
            }
        })
    }
}
