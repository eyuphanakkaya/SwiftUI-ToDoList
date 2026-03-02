//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI
import Combine

final class ListViewModel: ObservableObject {
    
    private let persistence: Persisting
    
    @Published var items: [ItemModel] = [] {
        didSet {
            save()
        }
    }
    
    init(persistence: Persisting) {
        self.persistence = persistence
    }
    
    private func save() {
        persistence.save(items: items)
    }
    
    func getItems() {
        guard let loadItems = persistence.load() else {return}
        items = loadItems
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateIsCompleted(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func delete(index: IndexSet) {
        items.remove(atOffsets: index)
    }
}
