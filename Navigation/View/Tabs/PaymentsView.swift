//
//  PaymentsView.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import JJNavigation
import SwiftUI

struct PaymentsView: View {
    @State var height: CGFloat = 100
    var body: some View {
        Color.blue
            .sheet(isPresented: .constant(true), content: {
                SheetContentWrapper {
                    Color.red
                        .frame(height: height)
                        .overlay(content: {
                            Text(height.description)
                        })
                        .onTapGesture {
                            withAnimation {
                                self.height = [200, 300, 50, 100, 200].randomElement()!
                            }
                        }
                }
            })
    }
}
