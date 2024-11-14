//
//  FlatMap.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 14/11/24.
//

import SwiftUI
import Combine

struct FlatMapExampleView: View {
    // State variable to display user profile information
    @State private var profileInfo: String = "Press the button to load a profile"
    
    // PassthroughSubject to publish random user IDs
    private let userIDPublisher = PassthroughSubject<Int, Never>()
    
    // AnyCancellable to store the subscription
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("FlatMap Operator Example")
                .font(.headline)
                .padding()
            
            Text(profileInfo) // Display the fetched profile information
                .font(.title)
                .padding()
            
            Button("Load Random User Profile") {
                // Generate a random user ID and send it to userIDPublisher
                let randomUserID = Int.random(in: 1...100)
                userIDPublisher.send(randomUserID)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear {
            // Use flatMap to transform each user ID into a simulated API call publisher
            cancellable = userIDPublisher
                .flatMap { userID in
                    fetchUserProfile(for: userID)
                }
                .sink { profile in
                    profileInfo = profile
                }
        }
        .onDisappear {
            // Cancel the subscription when the view disappears
            cancellable?.cancel()
        }
    }
    
    // Simulated API call that returns a publisher with user profile data
    private func fetchUserProfile(for userID: Int) -> AnyPublisher<String, Never> {
        // Simulate a delay and create profile information based on the userID
        let profile = "User ID: \(userID)\nName: User \(userID)\nAge: \(20 + userID % 10)"
        return Just(profile)
            .delay(for: .seconds(1), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

struct FlatMapExampleView_Previews: PreviewProvider {
    static var previews: some View {
        FlatMapExampleView()
    }
}
