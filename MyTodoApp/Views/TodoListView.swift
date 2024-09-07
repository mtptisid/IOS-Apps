//
//  TodoListView.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import FirebaseFirestore
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "Users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId)
        )
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodolistitemsView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("My To Do List")
            .toolbar {
                Button {
                //actions
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItenmPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    TodoListView(userId: "")
}
