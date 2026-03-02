//
//  Persisting.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 2.03.2026.
//

import Foundation

protocol Persisting {
    func save(items: [ItemModel])
    func load() -> [ItemModel]?
    func delete()
}
