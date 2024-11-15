//
//  FormExampleView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI
import Combine

struct FormExampleView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Registration Form")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                FormTextField(placeholder: "Name", text: $name)
                FormTextField(placeholder: "Email", text: $email)
                FormTextField(placeholder: "Phone", text: $phone)
                
                FormButton(text: "Save") {
                    print($name)
                }
                
                Spacer()
            }
        }
        .padding()
        .onAppear {
            print("On Appear")
        }
        .onDisappear {
            print("On Disappear")
        }
    }
}

#Preview {
    FormExampleView()
}
