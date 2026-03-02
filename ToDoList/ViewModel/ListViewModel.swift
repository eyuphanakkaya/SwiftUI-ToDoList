//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI
import Combine

final class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    private func getItems() {
        let itme1 = ItemModel(title: "This is the first title", isCompleted: false)
        let item2 = ItemModel(title: "This is the second title", isCompleted: true)
        let item3 = ItemModel(title: "This is the thirt title", isCompleted: true)
        
        items.append(contentsOf: [itme1, item2, item3])
    }
    
    func delete(index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateIsCompleted(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
