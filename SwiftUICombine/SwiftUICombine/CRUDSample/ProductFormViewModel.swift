//
//  ProductFormViewModel.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import SwiftUI
import Combine
import Alamofire

class ProductFormViewModel: ObservableObject {
    
    private var isEditing = false
    private var id: String = UUID().uuidString
    
    @Published var title: String = "Create Product"
    @Published var name: String = ""
    @Published var price: String = ""
    @Published var submitEnabled: Bool = false
    @Published var isLoading: Bool = false
    
    func setup(product: ProductDTO?) {
        if let product = product {
            id = product.id
            name = product.name
            price = "\(product.price)"
            
            title = "Update Product"
            
            isEditing = true
        }
        
        setupValidation()
    }
    
    func setupValidation() {
        Publishers.CombineLatest($name, $price)
            .map { name, price in
                return !name.isEmpty && price.isValidFloat()
            }
            .assign(to: &$submitEnabled)
    }
    
    func save() async throws {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        let parameters: [String: Any] = [
            "id": id,
            "name": name,
            "price": Float(price) ?? 0.0
        ]
        
        if !isEditing {
            try await insertNewProduct(parameters)
        } else {
            try await updateProduct(parameters)
        }
    }
    
    func insertNewProduct(_ parameters: [String: Any]) async throws {
        try await withCheckedThrowingContinuation { continuation in
            NetworkManager.shared
                .postRequest(url: Constants.productUrl, 
                             parameters: parameters) { (result: Result<ProductResponseDTO, AFError>) in
                    self.processResult(continuation, result)
                }
        }
    }
    
    func updateProduct(_ parameters: [String: Any]) async throws {
        try await withCheckedThrowingContinuation { continuation in
            NetworkManager.shared
                .putRequest(url: "\(Constants.productUrl)?id=\(id)", 
                            parameters: parameters) { (result: Result<ProductResponseDTO, AFError>) in
                    self.processResult(continuation, result)
                }
        }
    }
    
    private func processResult(_ continuation: CheckedContinuation<(), any Error>, _ result: Result<ProductResponseDTO, AFError>) {
        switch result {
        case .success:
            continuation.resume()
        case .failure(let error):
            continuation.resume(throwing: error)
            self.isLoading = false
        }
    }
}
