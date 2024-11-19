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
            VStack {
                List {
                    ForEach(viewModel.products) { item in
                        Text(item.name)
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
                            print("Add")
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .blur(radius: viewModel.isLoading ? 3 : 0)
            
            if viewModel.isLoading {
                LoadingView()
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
