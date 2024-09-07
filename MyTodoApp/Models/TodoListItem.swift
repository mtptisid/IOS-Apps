//
//  TodoListItem.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let duedate: TimeInterval
    let createddate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
