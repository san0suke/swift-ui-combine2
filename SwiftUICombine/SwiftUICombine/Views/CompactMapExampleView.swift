//
//  CompactMapExampleView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI
import Combine

struct CompactMapExampleView: View {
    // State to hold the user's text input
    @State private var userInput: String = ""
    
    // State to display the last valid integer
    @State private var validNumberText: String = "Enter a number"
    
    // PassthroughSubject to publish user inputs
    private let inputPublisher = PassthroughSubject<String, Never>()
    
    // AnyCancellable to store the subscription
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("CompactMap Operator Example")
                .font(.headline)
                .padding()
            
            TextField("Type a number", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: userInput) { oldState, newState in
                    inputPublisher.send(newState)
                }
            
            Text(validNumberText) // Display the last valid integer
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
        }
        .onAppear {
            // Use compactMap to attempt to convert each input to an Int and discard non-numeric inputs
            cancellable = inputPublisher
                .compactMap { Int($0) } // Attempts to convert the input to an integer, ignoring nil results
                .sink { validNumber in
                    validNumberText = "Valid Number: \(validNumber)"
                }
        }
        .onDisappear {
            // Cancel the subscription when the view disappears
            cancellable?.cancel()
        }
    }
}

struct CompactMapExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CompactMapExampleView()
    }
}
