//
//  ListRowView.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI

struct ListRowView: View {
    private let item: ItemModel
    
    init(item: ItemModel) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            let icon = item.isCompleted ? "checkmark.circle" : "circle"
            Image(systemName: icon)
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    let item1 = ItemModel(title: "First Item", isCompleted: false)
    let item2 = ItemModel(title: "Second Item", isCompleted: true)
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
