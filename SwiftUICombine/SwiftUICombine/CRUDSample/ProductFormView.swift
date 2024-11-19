//
//  ProductFormView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import SwiftUI

struct ProductFormView: View {
    
    @ObservedObject var viewModel = ProductFormViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                FormTitle(text: $viewModel.title)
                
                FormTextField(placeholder: "Name", text: $viewModel.name)
                FormTextField(placeholder: "Price", text: $viewModel.price)
                FormButton(text: "Save", isEnabled: $viewModel.submitEnabled) {
                    viewModel.save()
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.setupValidation()
        }
    }
}

#Preview {
    ProductFormView()
}
