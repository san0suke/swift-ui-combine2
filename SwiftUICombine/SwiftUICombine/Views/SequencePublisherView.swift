//
//  SequencePublisherView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 13/11/24.
//

import SwiftUI
import Combine

struct SequencePublisherView: View {
    // State variables to store the current message and the subscription
    @State private var currentMessage: String = "Waiting for messages..."
    @State private var cancellable: AnyCancellable?

    // Sample array of messages to display
    private let messages = ["Hello", "Welcome to SwiftUI!", "This is Combine in action!", "Enjoy learning!"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Publishers.Sequence Example")
                .font(.headline)
                .padding()
            
            Text(currentMessage) // Display the current message
                .font(.title)
                .padding()
            
            Button("Start Sequence") {
                startSequence()
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
    
    private func startSequence() {
        // Create a Publishers.Sequence with an array of messages and specify Failure as Never
        cancellable = Publishers.Sequence(sequence: messages)
            .setFailureType(to: Never.self)
            .sink(receiveCompletion: { _ in
                currentMessage = "All messages received!"
            }, receiveValue: { value in
                currentMessage = value
                // Add a delay between messages (for effect)
                RunLoop.main.run(until: Date().addingTimeInterval(1.0))
            })
    }
}

struct SequencePublisherView_Previews: PreviewProvider {
    static var previews: some View {
        SequencePublisherView()
    }
}
