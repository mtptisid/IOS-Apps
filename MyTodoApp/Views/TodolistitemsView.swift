//
//  TodolistitemsView.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import SwiftUI

struct TodolistitemsView: View {
    @StateObject var viewModel = TodolistitemsViewViewModel()
    
    let item: TodoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    
                Text("\(Date(timeIntervalSince1970: item.duedate ).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    TodolistitemsView(item: .init(id: "123", title: "Get Milk", duedate: Date().timeIntervalSince1970, createddate: Date().timeIntervalSince1970, isDone: true))
}
