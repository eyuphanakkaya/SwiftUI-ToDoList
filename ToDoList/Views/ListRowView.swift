//
//  ListRowView.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI

struct ListRowView: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(title: "This is the first item!")
}
