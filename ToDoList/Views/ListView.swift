//
//  ListView.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "This is the second title", isCompleted: true),
        ItemModel(title: "This is the thirt title", isCompleted: true)    ]
    
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .navigationTitle("ToDo List 📋")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                NavigationLink("Edit") {
                    
                }
            }
        }
    }
}



#Preview {
    NavigationStack {
        ListView()
    }
}
