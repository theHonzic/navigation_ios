//
//  NavigationRouter.swift
//  Navigation
//
//  Created by Jan Janovec on 10.01.2024.
//

import SwiftUI

final class NavigationRouter<T: Routable>: ObservableObject {
    @Published var stack: [T] = []
    
    var currentItem: T? {
        stack.last
    }
    
    var isStackEmpty: Bool {
        self.stack.count == 0
    }
    
    func popBack() {
        self.stack.removeLast()
    }
    
    func popToRoot() {
        self.stack = .init()
    }
    
    func navigate(to route: T) {
        self.stack.append(route)
    }
}
