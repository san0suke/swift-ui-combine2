//
//  GraphSample.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 17/11/24.
//

import SwiftUI
import Charts
import Combine

struct LineGraphSample: View {
    @StateObject private var viewModel = GraphSampleViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Real-Time Sales Data")
                    .font(.title)
                    .padding()
                
                Chart(viewModel.data) { item in
                    LineMark(
                        x: .value("Month", item.month),
                        y: .value("Sales", item.sales)
                    )
                    .foregroundStyle(.blue)
                    .symbol(Circle())
                }
                .padding()
            }
            .navigationTitle("Dynamic Line Chart")
        }
    }
}

struct GraphSample_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphSample()
    }
}

