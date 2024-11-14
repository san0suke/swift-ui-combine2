//
//  DeferredExampleView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 13/11/24.
//

import SwiftUI
import Combine

struct DeferredExampleView: View {
    // State variable to display the random number in the view
    @State private var randomNumberText: String = "Press the button for a random number"
    
    // AnyCancellable to store the subscription
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Deferred Publisher Example")
                .font(.headline)
                .padding()
            
            Text(randomNumberText) // Display the current random number
                .font(.title)
                .padding()
            
            Button("Generate Random Number") {
                generateRandomNumber()
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onDisappear {
            // Cancel the subscription when the view disappears
            cancellable?.cancel()
        }
    }
    
    private func generateRandomNumber() {
        // Use Deferred to create a new publisher that emits a random number
        let deferredPublisher = Deferred {
            Just(Int.random(in: 1...100))
        }
        
        // Subscribe to the Deferred publisher
        cancellable = deferredPublisher
            .sink { randomValue in
                randomNumberText = "Random Number: \(randomValue)"
            }
    }
}

struct DeferredExampleView_Previews: PreviewProvider {
    static var previews: some View {
        DeferredExampleView()
    }
}
