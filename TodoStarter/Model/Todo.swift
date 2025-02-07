//
//  Todo.swift
//  ToDoSample
//
//  Created by Noah Giboney on 2/5/25.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title = ""
    var type: TodoType = .home
}

enum TodoType: String, CaseIterable {
    case home, work, fun
    
    var systemImage: String {
        switch self {
        case .home:
            "house"
        case .work:
            "hammer"
        case .fun:
            "figure.run"
        }
    }
}
