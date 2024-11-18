//
//  ProductListView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import SwiftUI
import Combine

struct ProductListView: View {
    
    @ObservedObject var viewModel = ProductListViewModel()
    
    var body: some View {
        VStack {
            Text("Product list")
                .font(.title)
                .padding()
            
            List(viewModel.products, id: \.self) { item in
                Text(item)
            }
        }
    }
}

#Preview {
    ProductListView()
}
