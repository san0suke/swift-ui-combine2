//
//  BarGraphSample.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 17/11/24.
//

import SwiftUI
import Charts
import Combine

struct BarGraphSample: View {
    
    @ObservedObject var viewModel = GraphSampleViewModel()
    
    var body: some View {
        VStack {
            Chart(viewModel.data) { item in
                BarMark(x: .value("Month", item.month),
                         y: .value("Sales", item.sales))
                    .foregroundStyle(.blue)
            }
            .navigationTitle("Bar sales charts")
            .padding(.top)
        }
    }
}
