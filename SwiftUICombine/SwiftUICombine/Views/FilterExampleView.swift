//
//  FilterExampleView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI
import Combine

struct FilterExampleView: View {
    // State variable to display the filtered number
    @State private var filteredNumberText: String = "Press the button to generate a random even number"
    
    // PassthroughSubject to publish random numbers
    private let numberPublisher = PassthroughSubject<Int, Never>()
    
    // AnyCancellable to store the subscription
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Filter Operator Example")
                .font(.headline)
                .padding()
            
            Text(filteredNumberText) // Display the filtered number
                .font(.title)
                .padding()
            
            Button("Generate Random Number") {
                // Send a random number through the publisher
                let randomNum = Int.random(in: 1...100)
                numberPublisher.send(randomNum)
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear {
            // Use the filter operator to allow only even numbers to pass through
            cancellable = numberPublisher
                .filter { number in
                    number % 2 == 0 // Only pass even numbers
                }
                .sink { evenNumber in
                    filteredNumberText = "Filtered Even Number: \(evenNumber)"
                }
        }
        .onDisappear {
            // Cancel the subscription when the view disappears
            cancellable?.cancel()
        }
    }
}

struct FilterExampleView_Previews: PreviewProvider {
    static var previews: some View {
        FilterExampleView()
    }
}
