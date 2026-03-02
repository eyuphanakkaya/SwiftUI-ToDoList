//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI
import Combine

final class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            save()
        }
    }
    private let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    private func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
        let decoded = try? JSONDecoder().decode([ItemModel].self, from: data)else {
            return
        }
        
        items = decoded
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
    
    func save() {
        let encoder = JSONEncoder()
        let encoded = try? encoder.encode(items)
        UserDefaults.standard.set(encoded, forKey: itemsKey)
    }
}
