//
//  ListViewFactory.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 2.03.2026.
//

import SwiftUI

final class ListViewFactory {
    static func make() -> some View {
        let userDefault = UserDefaultsManager()
        let viewModel = ListViewModel(persistence: userDefault)
        let view = ListView(viewModel: viewModel)
        return view
    }
}
