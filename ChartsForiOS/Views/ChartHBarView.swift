//
//  ChartHBarView.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 07/03/2022.
//

import SwiftUI
import Charts

struct ChartHBarView: View {
    var entries = [BarChartDataEntry]()
    var bub = [BubbleChartDataEntry]()

    init(){
        for x in 0 ..< 10{
            entries.append(BarChartDataEntry(x: Double(x), y: Double.random(in: 1...3)))
        }
        
        for x in 0 ..< 10{
            bub.append(BubbleChartDataEntry(x: Double(x), y: Double.random(in: 1...3), size: CGFloat.random(in: 1...3)))
        }
        
        
    }
    
    
    var body: some View {
        VStack{

            HorizontalBarChartViewResponse(data: entries)
//            BarChartViewResponse(data: entries )

        }
    }
}

struct ChartHBarView_Previews: PreviewProvider {
    static var previews: some View {
        ChartHBarView()
    }
}
