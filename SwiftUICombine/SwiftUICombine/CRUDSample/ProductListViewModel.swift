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
    var isLoading: Bool = true
    
    func loadProducts() {
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
}
