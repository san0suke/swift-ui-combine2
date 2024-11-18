//
//  ProductFormViewModel.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import SwiftUI
import Combine

class ProductFormViewModel: ObservableObject {
    
    var id: String?
    @Published var title: String = "Create Product"
    @Published var name: String = ""
    @Published var price: String = ""
    @Published var submitEnabled: Bool = false
    
    func setupValidation() {
        Publishers.CombineLatest($name, $price)
            .map { name, price in
                return !name.isEmpty && price.isValidFloat()
            }
            .assign(to: &$submitEnabled)
    }
    
    func save() {
        
    }
}
