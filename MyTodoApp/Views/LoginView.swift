//
//  LoginView.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import SwiftUI


struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "My First App",
                           subtitle: "Lest Get Things Done",
                           angle: 15,
                           Background: .cyan)
                
                
                
                
                // Login form
                
                
                Form {
                    
                    if  !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Lon In",
                             background: .blue){
                        //actions
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                        
                // Create accound
                VStack {
                    Text("New around here?!")
                   
                    NavigationLink("Create An account",
                    destination: RegisterView())
                }.padding(.bottom, 40)
                     Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
