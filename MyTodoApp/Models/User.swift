//
//  User.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 02/09/24.
//

import Foundation

struct User: Codable {
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
