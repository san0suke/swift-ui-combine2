//
//  FormExampleView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI
import Combine

struct FormExampleView: View {
    
    @ObservedObject var viewModel = FormExampleViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                FormTextField(placeholder: "Name", text: $viewModel.name)
                    .textContentType(.name)
                
                FormTextField(placeholder: "Email", text: $viewModel.email)
                    .textContentType(.emailAddress)
                
                FormTextField(placeholder: "Phone", text: $viewModel.phone)
                    .textContentType(.telephoneNumber)
                
                FormButton(text: "Save", 
                           isEnabled: $viewModel.submitButtonEnable) {
                    print("Saving...")
                }
                
                Spacer()
            }
        }
        .padding()
        .onAppear {
            viewModel.setupValidation()
        }
        .onDisappear {
            print("On Disappear")
        }
        .navigationTitle("Registration Form")
    }
}

#Preview {
    FormExampleView()
}
