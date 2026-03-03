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
        
        content
        .navigationTitle("ToDo List 📋")
        .onAppear(perform: {
            viewModel.getItems()
        })
        .toolbar {
            toolBarItems
        }
    }
    
    
    private var content: some View {
        ZStack {
            if viewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(viewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.updateIsCompleted(item: item)
                                }
                            }
                    }
                    .onDelete(perform: viewModel.delete)
                    .onMove(perform: viewModel.move)
                }
            }
        }
    }
    
    private var toolBarItems: some ToolbarContent {
        Group {
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
        ListViewFactory.make()
    }
}
