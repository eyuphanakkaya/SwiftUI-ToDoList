//
//  AddViewModel.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI
import Combine

final class AddViewModel: ObservableObject {
    @Published var errorMessage: String? = nil
    @Published var didSave = false

    func save(title: String) {
        guard title.count >= 3 else {
            errorMessage = "Title must be at least 3 characters"
            return
        }
        didSave = true
    }
}
