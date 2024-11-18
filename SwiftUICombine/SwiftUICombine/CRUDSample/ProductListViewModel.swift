//
//  ProductListViewModel.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import SwiftUI
import Combine

class ProductListViewModel: ObservableObject {
    
    @Published var products: [String] = ["product 1", "product 2", "product 3"]
}
