//
//  MapExampleView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI
import Combine

struct MapOperatorExampleView: View {
    // State variable to display the formatted number
    @State private var formattedNumber: String = "Press the button to get a random number"
    
    // PassthroughSubject to publish random numbers
    private let numberPublisher = PassthroughSubject<Int, Never>()
    
    // AnyCancellable to store the subscription
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Map Operator Example")
                .font(.headline)
                .padding()
            
            Text(formattedNumber) // Display the formatted number
                .font(.title)
                .padding()
            
            Button("Generate Random Number") {
                // Send a random number through the publisher
                let randomNum = Int.random(in: 1...100)
                numberPublisher.send(randomNum)
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear {
            // Use the map operator to transform the random number into a formatted string
            cancellable = numberPublisher
                .map { number in
                    "Generated Number: \(number) (formatted as: \(number * 10))"
                }
                .sink { formattedValue in
                    formattedNumber = formattedValue
                }
        }
        .onDisappear {
            // Cancel the subscription when the view disappears
            cancellable?.cancel()
        }
    }
}

struct MapOperatorExampleView_Previews: PreviewProvider {
    static var previews: some View {
        MapOperatorExampleView()
    }
}
