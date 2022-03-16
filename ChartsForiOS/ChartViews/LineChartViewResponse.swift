//
//  LineChartViewResponse.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 07/03/2022.
//

import SwiftUI
import Charts

struct LineChartViewResponse : UIViewRepresentable {
    var data:[ChartDataEntry]

    func makeUIView(context: Context) -> LineChartView {
        LineChartView()
            
    }

    func updateUIView(_ uiView: LineChartView, context: Context) {
        let setData = LineChartDataSet(entries: data, label: "Cost")
        let data = LineChartData(dataSet: setData)
        setData.mode = .cubicBezier
        setData.colors = chartsColor
        uiView.data = data
        
    }
}
