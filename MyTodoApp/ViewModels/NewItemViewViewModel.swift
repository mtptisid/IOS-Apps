//
//  NewItemViewViewModel.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init() {}
         
    func save() {
        guard canSave else {
            return
        }
        // currect user fetch
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        //Create model
        let newId = UUID().uuidString
        let newItem = TodoListItem(
            id: newId,
            title: title,
            duedate: dueDate.timeIntervalSince1970,
            createddate: Date().timeIntervalSince1970,
            isDone: false)
            
        // save model
            
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionsary())
        }
    
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}

