//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI
import Combine

final class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "This is the second title", isCompleted: true),
        ItemModel(title: "This is the thirt title", isCompleted: true)
    ]
    
    
    func delete(index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}
