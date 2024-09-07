//
//  TodolistitemsViewViewModel.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodolistitemsViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: TodoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone )
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionsary())
    }
         
}
