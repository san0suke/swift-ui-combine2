//
//  ProductListResponseDTO.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import Foundation

struct ProductListResponseDTO: Decodable {
    let success: Bool
    let data: [ProductDTO]
}
