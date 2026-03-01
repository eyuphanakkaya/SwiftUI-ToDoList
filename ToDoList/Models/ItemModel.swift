//
//  ItemModel.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import Foundation


struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
