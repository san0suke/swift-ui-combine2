//
//  ContentView.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 13/11/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
//        JustExampleView()
//        SequencePublisherView()
//        PassthroughSubjectView()
//        CurrentValueSubjectView()
//        DeferredExampleView()
//        MapOperatorExampleView()
//        FlatMapExampleView()
        FilterExampleView()
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
