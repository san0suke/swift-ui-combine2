//
//  FormExampleView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI
import Combine

struct FormExampleView: View {
    
//    private var namePublisher: AnyPublisher<String, Never> {
//        Just(name)
//            .eraseToAnyPublisher()
//    }
//    
//    private var emailPublisher: AnyPublisher<String, Never> {
//        Just(email)
//            .eraseToAnyPublisher()
//    }
//    
//    private var phonePublisher: AnyPublisher<String, Never> {
//        Just(phone)
//            .eraseToAnyPublisher()
//    }
    @ObservedObject var viewModel = FormExampleViewModel()
    
    private var cancellables: Set<AnyCancellable> = []
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Registration Form")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
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
    }
}

#Preview {
    FormExampleView()
}
