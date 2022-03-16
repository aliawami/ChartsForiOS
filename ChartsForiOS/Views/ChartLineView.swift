//
//  ChartLineView.swift
//  ChartsBuilding
//
//  Created by Ali Alawami on 01/03/2022.
//

import SwiftUI
import Charts


struct ChartLineView: View {
    
    var entries = [ChartDataEntry]()

    init(){
        for x in 0 ..< 10{
            entries.append(ChartDataEntry(x: Double(x), y: Double.random(in: 1...3)))
        }
    }
    
    var body: some View {
        VStack {
//            Text("Hello, World!")
            LineChartViewResponse(data: entries)
        }
        
    }
}

struct ChartLineView_Previews: PreviewProvider {
    static var previews: some View {
        ChartLineView()
    }
}
