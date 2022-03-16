//
//  ChartMainview.swift
//  ChartsBuilding
//
//  Created by Ali Alawami on 28/02/2022.
//

import SwiftUI
import Charts



struct ChartMainview: View {
    var entries = [BarChartDataEntry]()

    init(){
        for x in 0 ..< 10{
            entries.append(BarChartDataEntry(x: Double(x), y: Double.random(in: 1...3)))
        }
    }
    
    var body: some View {
        VStack{
            BarChartViewResponse(data: entries)
//                .frame(height: 300)
        }
    }
}

struct ChartMainview_Previews: PreviewProvider {
    static var previews: some View {
        ChartMainview()
    }
}
