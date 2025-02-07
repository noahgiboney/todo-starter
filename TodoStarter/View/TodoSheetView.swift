//
//  TodoSheetView.swift
//  ToDoSample
//
//  Created by Noah Giboney on 2/5/25.
//

import SwiftUI

struct TodoSheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var todos: [Todo]
    @State private var todo = Todo()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $todo.title)
                
                Picker("Type", selection: $todo.type) {
                    ForEach(TodoType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                
                Section {
                    Button("Add") {
                        todos.append(todo)
                        dismiss()
                    }
                    .disabled(todo.title.isEmpty)
                }
            }
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Close") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var todos: [Todo] = []
    
    TodoSheetView(todos: $todos)
}
