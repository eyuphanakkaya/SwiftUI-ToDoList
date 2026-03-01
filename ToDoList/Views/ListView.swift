//
//  ListView.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the first title!",
        "This is the second title!",
        "This is the third title!"
    ]
    
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
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
