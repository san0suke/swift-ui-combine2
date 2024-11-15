//
//  FormErrorMessage.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI

struct FormErrorMessage: View {
    
    var text: String
    @Binding var show: Bool
    
    var body: some View {
        if show {
            Text(text)
                .font(.headline)
                .padding()
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.red)
        }
    }
}

#Preview {
    FormErrorMessage(text: "Invalid data", show: Binding(projectedValue: .constant(true)))
}
