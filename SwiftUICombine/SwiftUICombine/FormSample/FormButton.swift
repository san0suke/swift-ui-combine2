//
//  FormButton.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI

struct FormButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(text, action: action)
            .padding()
            .font(.headline)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

#Preview {
    FormButton(text: "Submit", action: {})
}
