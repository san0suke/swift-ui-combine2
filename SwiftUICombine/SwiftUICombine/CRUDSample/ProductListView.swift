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
    @State private var selectedProduct: ProductDTO?
    @State private var navigateToForm = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(viewModel.products) { item in
                            Button {
                                selectedProduct = item
                                navigateToForm = true
                            } label: {
                                Text(item.name)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.delete(indexSet)
                        })
                    }
                    .navigationTitle("Product list")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                selectedProduct = nil
                                navigateToForm = true
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
                .blur(radius: viewModel.isLoading ? 3 : 0)
                .navigationDestination(isPresented: $navigateToForm) {
                    ProductFormView(product: selectedProduct)
                }
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            .onAppear {
                viewModel.loadProducts()
            }
        }
    }
}

#Preview {
    ProductListView()
}
