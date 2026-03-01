//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI


@main
struct ToDoListApp: App {
    let vm = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView(viewModel: vm)
            }
        }
    }
}
