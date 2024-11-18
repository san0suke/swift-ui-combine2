//
//  FormTitle.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 18/11/24.
//

import SwiftUI

struct FormTitle: View {
    
    @Binding var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    FormTitle(text: .constant("Title"))
}
