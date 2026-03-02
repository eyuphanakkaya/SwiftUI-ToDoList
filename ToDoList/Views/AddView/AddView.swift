//
//  AddView.swift
//  ToDoList
//
//  Created by Eyüphan Akkaya on 1.03.2026.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var viewModel: AddViewModel
    @State var textFieldText: String = ""
    @Environment(\.dismiss) var dismiss
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button {
                    save()
                } label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }

        }
        .padding(14)
        .navigationTitle("Add an Item 🖊️")
        .onChange(of: viewModel.didSave) { _ ,newDidSave  in
            if newDidSave { dismiss() }
        }
        
        
    }
    
    private func save() {
        viewModel.save(title: textFieldText)
    }
}

#Preview {
    NavigationStack {
        AddViewFactory.make()
    }
}
