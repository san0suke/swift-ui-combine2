//
//  FormButton.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI

struct FormButton: View {
    
    var text: String
    @Binding var isEnabled: Bool
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(text)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isEnabled ? .blue : .gray)
                .cornerRadius(8)
                .disabled(!isEnabled)
        }
    }
}

#Preview {
    FormButton(text: "Submit",
               isEnabled: .constant(false),
               action: {})
}
