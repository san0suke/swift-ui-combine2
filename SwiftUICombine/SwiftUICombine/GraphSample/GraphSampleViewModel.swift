//
//  GraphSampleViewModel.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 17/11/24.
//

import Foundation
import Combine

class GraphSampleViewModel: ObservableObject {
    @Published var data: [GraphSampleSalesData] = []
    private var cancellables = Set<AnyCancellable>()
    private var timer: AnyCancellable?
    
    init() {
        startGeneratingData()
    }
    
    func startGeneratingData() {
        timer = Timer.publish(every: 2, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.addRandomData()
            }
    }
    
    private func addRandomData() {
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let randomMonth = months.randomElement() ?? "Unknown"
        let randomSales = Double.random(in: 100...300)
        
        let newEntry = GraphSampleSalesData(month: randomMonth, sales: randomSales)
        
        DispatchQueue.main.async {
            if self.data.count >= 12 {
                self.data.removeFirst()
            }
            self.data.append(newEntry)
        }
    }
}
