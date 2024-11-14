//
//  PassthroughSubjectView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 13/11/24.
//

import SwiftUI
import Combine

struct PassthroughSubjectView: View {
    // State variable to display the message in the view
    @State private var message: String = "Waiting for update..."
    
    // PassthroughSubject to publish new messages
    private let messageSubject = PassthroughSubject<String, Never>()
    
    // AnyCancellable to store the subscription
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("PassthroughSubject Example")
                .font(.headline)
                .padding()
            
            Text(message) // Display the current message
                .font(.title)
                .padding()
            
            Button("Send New Message") {
                // Trigger the PassthroughSubject with a new message
                messageSubject.send("Hello from PassthroughSubject!")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear {
            // Subscribe to the subject when the view appears
            cancellable = messageSubject
                .sink { newMessage in
                    message = newMessage
                }
        }
        .onDisappear {
            // Cancel the subscription when the view disappears
            cancellable?.cancel()
        }
    }
}

struct PassthroughSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        PassthroughSubjectView()
    }
}
