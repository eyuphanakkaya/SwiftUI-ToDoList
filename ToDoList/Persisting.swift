//
//  Persisting.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 2.03.2026.
//

import Foundation

protocol Persisting {
    associatedtype Item: Codable
    
    func save(items: Item)
    func load() -> Item?
    func delete()
}
