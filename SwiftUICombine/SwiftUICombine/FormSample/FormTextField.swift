//
//  FormTextField.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI

struct FormTextField: View {
    
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(.title)
            .padding(.vertical, 5)
            .padding(.horizontal)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1) // Blue border
            )
    }
}

#Preview {
    FormTextField(placeholder: "Name", text: .constant(""))
}
