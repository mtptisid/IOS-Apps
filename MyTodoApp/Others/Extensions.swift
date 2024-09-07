//
//  Extensions.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 05/09/24.
//

import Foundation

extension Encodable {
    
    func asDictionsary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return[:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch{
            return [:]
        }
    }
}
