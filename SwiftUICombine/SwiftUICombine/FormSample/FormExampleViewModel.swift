//
//  FormExampleViewModel.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 15/11/24.
//

import SwiftUI
import Combine

class FormExampleViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var submitButtonEnable: Bool = false
    
    public func setupValidation() {
        Publishers.CombineLatest3($name, $email, $phone)
            .map { name, email, phone in
                return email.isValidEmail()
                    && !name.isEmpty
                    && !phone.isEmpty
            }
            .assign(to: &$submitButtonEnable)
    }
}
