//
//  ListView.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
            List {
                ForEach(viewModel.items) { item in
                    ListRowView(item: item)
                }
                .onDelete(perform: viewModel.delete)
                .onMove(perform: viewModel.move)
            }
            .navigationTitle("ToDo List 📋")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        AddViewFactory.make()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
    }

}



#Preview {
    NavigationStack {
        let viewModel = ListViewModel()
        ListView(viewModel: viewModel)
    }
}
