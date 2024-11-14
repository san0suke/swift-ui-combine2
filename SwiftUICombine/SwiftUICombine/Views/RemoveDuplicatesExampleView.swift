//
//  RemoveDuplicatesExampleView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI
import Combine

struct RemoveDuplicatesExampleView: View {
    // State variable to display the latest unique number
    @State private var uniqueNumberText: String = "Press the button to generate a unique number"
    
    // PassthroughSubject to publish random numbers
    private let numberPublisher = PassthroughSubject<Int, Never>()
    
    // AnyCancellable to store the subscription
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("RemoveDuplicates Operator Example")
                .font(.headline)
                .padding()
            
            Text(uniqueNumberText) // Display the unique number
                .font(.title)
                .padding()
            
            Button("Generate Random Number") {
                // Send a random number through the publisher
                let randomNum = Int.random(in: 1...10) // Use a smaller range to show duplicates more often
                numberPublisher.send(randomNum)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear {
            // Use removeDuplicates to filter out consecutive duplicate numbers
            cancellable = numberPublisher
                .removeDuplicates()
                .sink { uniqueNumber in
                    uniqueNumberText = "Unique Number: \(uniqueNumber)"
                }
        }
        .onDisappear {
            // Cancel the subscription when the view disappears
            cancellable?.cancel()
        }
    }
}

struct RemoveDuplicatesExampleView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveDuplicatesExampleView()
    }
}
