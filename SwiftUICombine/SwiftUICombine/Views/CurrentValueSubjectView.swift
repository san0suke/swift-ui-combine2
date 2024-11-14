//
//  CurrentValueSubjectView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 13/11/24.
//

import SwiftUI
import Combine

struct CurrentValueSubjectView: View {
    // State variable to display the current count in the view
    @State private var countText: String = "Current Count: 0"
    
    // CurrentValueSubject to hold and update the count
    private var countSubject = CurrentValueSubject<Int, Never>(0)
    
    // AnyCancellable to store the subscription
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("CurrentValueSubject Example")
                .font(.headline)
                .padding()
            
            Text(countText) // Display the current count
                .font(.title)
                .padding()
            
            Button("Increment Count") {
                // Increment the count value in CurrentValueSubject
                countSubject.value += 1
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear {
            // Subscribe to the CurrentValueSubject and update the countText on change
            cancellable = countSubject
                .sink { newCount in
                    countText = "Current Count: \(newCount)"
                }
        }
        .onDisappear {
            // Cancel the subscription when the view disappears
            cancellable?.cancel()
        }
    }
}

struct CurrentValueSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentValueSubjectView()
    }
}
