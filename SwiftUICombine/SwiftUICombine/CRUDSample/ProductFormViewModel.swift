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
    
    var id: String = UUID().uuidString
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
    
    func save() async throws {
        let parameters: [String: Any] = [
            "id": id,
            "name": name,
            "price": Float(price) ?? 0.0
        ]
        
        try await withCheckedThrowingContinuation { continuation in
            NetworkManager.shared
                .postRequest(url: Constants.productUrl, parameters: parameters) { (result: Result<ProductResponseDTO, AFError>) in
                    switch result {
                    case .success(let response):
                        print("Response:", response)
                        continuation.resume()
                    case .failure(let error):
                        print("Error:", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
