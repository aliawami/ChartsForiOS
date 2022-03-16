//
//  ChartCommonView.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 07/03/2022.
//

import SwiftUI
import Charts

struct ChartCommonView: View {
    var entries = [ChartDataEntry]()
    var bub = [BubbleChartDataEntry]()

    init(){
        for x in 0 ..< 10{
            entries.append(ChartDataEntry(x: Double(x), y: Double.random(in: 1...3)))
        }
        
        for x in 0 ..< 10{
            bub.append(BubbleChartDataEntry(x: Double(x), y: Double.random(in: 1...3), size: CGFloat.random(in: 1...3)))
        }
        
        
    }
    
    
    var body: some View {
        VStack{
            Text("test")
//            CommonChartViewResponce<PieChartView>(data: entries )
//            CommonChartViewResponce<LineChartView>(data: entries )
        }
    }
}

struct ChartCommonView_Previews: PreviewProvider {
    static var previews: some View {
        ChartCommonView()
    }
}
