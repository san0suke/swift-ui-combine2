//
//  ProductFormView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import SwiftUI

struct ProductFormView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ProductFormViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                FormTextField(placeholder: "Name", text: $viewModel.name)
                FormTextField(placeholder: "Price", text: $viewModel.price)
                FormButton(text: "Save", isEnabled: $viewModel.submitEnabled) {
                    Task {
                        await saveProduct()
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.setupValidation()
        }
        .navigationTitle($viewModel.title)
    }
    
    private func saveProduct() async {
        do {
            try await viewModel.save()
            dismiss()
        } catch {
            print("Error saving")
        }
    }
}

#Preview {
    ProductFormView()
}
