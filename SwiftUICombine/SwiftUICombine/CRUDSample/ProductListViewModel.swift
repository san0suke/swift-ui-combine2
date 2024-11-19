//
//  ProductListViewModel.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import SwiftUI
import Combine
import Alamofire

class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductDTO] = []
    @Published var isLoading: Bool = true
    
    func loadProducts() {
        self.isLoading = true
        NetworkManager.shared
            .getRequest(url: Constants.productUrl) { (result: Result<ProductListResponseDTO, AFError>) in
            switch result {
            case .success(let response):
                self.products = response.data
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
            self.isLoading = false
        }
    }
    
    func delete(_ indexSet: IndexSet) {
        self.isLoading = true
        
        for productIndex in indexSet {
            let id = products[productIndex].id
            NetworkManager.shared
                .deleteRequest(url: "\(Constants.productUrl)?id=\(id)") { (result: Result<ProductResponseDTO, AFError>) in
                switch result {
                case .failure(let error):
                    print("Error:", error.localizedDescription)
                    self.loadProducts()
                default:
                    break
                }
                    
                self.isLoading = false
            }
            
            products.remove(at: productIndex)
        }
    }
}
