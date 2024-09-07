//
//  NewItemView.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItenmPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Iem")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //new  elements
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button to submit
                TLButton(title: "Save", 
                         background: .pink){
                    //
                    if viewModel.canSave {
                        viewModel.save()
                        newItenmPresented = false
                    } else {
                        viewModel.showAlert = true 
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("error"),
                      message: Text("Please fill the Item title and select valid due date"))
            }
        }
    }
}

#Preview {
    NewItemView(newItenmPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
