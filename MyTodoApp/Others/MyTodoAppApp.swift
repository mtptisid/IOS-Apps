//
//  MyTodoAppApp.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//
import FirebaseCore
import SwiftUI

@main
struct MyTodoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
