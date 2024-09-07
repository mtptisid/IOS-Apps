//
//  TodoListViewViewModel.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import FirebaseFirestore
import Foundation

class TodoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
         
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
