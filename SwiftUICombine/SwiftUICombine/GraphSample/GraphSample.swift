//
//  GraphSample.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 17/11/24.
//

import SwiftUI
import Charts

struct SalesData: Identifiable {
    let id = UUID()
    let month: String
    let sales: Double
}

struct GraphSample: View {
    let data = [
        SalesData(month: "Jan", sales: 200),
        SalesData(month: "Feb", sales: 180),
        SalesData(month: "Mar", sales: 220),
        SalesData(month: "Apr", sales: 160),
        SalesData(month: "May", sales: 250)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sales Report")
                    .font(.title)
                    .padding()
                
                Chart(data) { item in
                    BarMark(
                        x: .value("Month", item.month),
                        y: .value("Sales", item.sales)
                    )
                    .foregroundStyle(.blue)
                }
                .frame(height: 300)
                .padding()
            }
            .navigationTitle("Chart Example")
        }
    }
}

struct GraphSample_Previews: PreviewProvider {
    static var previews: some View {
        GraphSample()
    }
}
