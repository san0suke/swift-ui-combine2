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
        ZStack {
            if viewModel.isLoading {
                LoadingView()
            } else {
                VStack {
                    Text("Product list")
                        .font(.title)
                        .padding()
                    
                    
                    List {
                        ForEach(viewModel.products) { item in
                            Text(item.name)
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.delete(indexSet)
                        })
                    }
                    .toolbar {
                        EditButton()
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }
}

#Preview {
    ProductListView()
}
