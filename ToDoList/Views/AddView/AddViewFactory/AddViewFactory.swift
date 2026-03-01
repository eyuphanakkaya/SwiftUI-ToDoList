//
//  AddViewFactory.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI

final class AddViewFactory {
    static func make() -> some View {
        let viewModel = AddViewModel()
        let view = AddView(viewModel: viewModel)

        return view
    }
}
