//
//  ContentView.swift
//  ToDoSample
//
//  Created by Noah Giboney on 2/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var todos: [Todo] = []
    @State private var showNewSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    ListRowView(todo: todo)
                }
            }
            .navigationTitle("Todo")
            .sheet(isPresented: $showNewSheet) {
                TodoSheetView(todos: $todos)
            }
            .toolbar {
                Button("Add") {
                    showNewSheet.toggle()
                }
            }
            .overlay {
                if todos.isEmpty {
                    ContentUnavailableView("Nothing Yet", systemImage: "pin")
                }
            }
        }
    }
    
    struct ListRowView: View {
        var todo: Todo
        
        var body: some View {
            HStack {
                Image(systemName: todo.type.systemImage)
                
                VStack(alignment: .leading) {
                    Text(todo.title)
                    Text(todo.type.rawValue.capitalized)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
