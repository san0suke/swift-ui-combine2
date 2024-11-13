//
//  SwiftUICombineApp.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 13/11/24.
//

import SwiftUI

@main
struct SwiftUICombineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
