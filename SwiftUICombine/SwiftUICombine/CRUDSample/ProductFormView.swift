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
    @State var product: ProductDTO?
    
    var body: some View {
        ZStack {
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
                viewModel.setup(product: product)
            }
            .navigationTitle($viewModel.title)
            .blur(radius: viewModel.isLoading ? 3 : 0)
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        
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
