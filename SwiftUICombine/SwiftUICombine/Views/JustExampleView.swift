//
//  JustExampleView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 13/11/24.
//

import SwiftUI
import Combine

struct JustExampleView: View {
    // State variable to store the received value
    @State private var message: String = "Waiting for message..."
    
    // State to hold the cancellable subscription
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack {
            Text("Just Publisher Example")
                .font(.headline)
                .padding()
            
            Text(message) // Display the received message
                .font(.title)
                .padding()
            
            Button("Get Message") {
                message = "ABC 1234"
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onDisappear {
            // Cancel the subscription if the view disappears
            cancellable?.cancel()
        }
    }
    
    private func getMessage() {
        // Using the Just publisher to send a single message
        cancellable = Just("Hello from Just!")
            .sink { value in
                message = value
            }
    }
}

struct JustExampleView_Previews: PreviewProvider {
    static var previews: some View {
        JustExampleView()
    }
}
