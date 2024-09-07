//
//  ContentView.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import SwiftUI


struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: viewModel.currentUserId)
                .tabItem { Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
