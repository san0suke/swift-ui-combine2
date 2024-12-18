//
//  ProductDTO.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import Foundation

struct ProductDTO: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var price: Double
}
