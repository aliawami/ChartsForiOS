//
//  BubbleChartViewResponse.swift
//  ChartsBuilding
//
//  Created by Ali Alawami on 01/03/2022.
//

import SwiftUI
import Charts


struct BubbleChartViewResponse : UIViewRepresentable {
    var data:[ChartDataEntry]

    func makeUIView(context: Context) -> BubbleChartView {
        BubbleChartView()
    }

    func updateUIView(_ uiView: BubbleChartView, context: Context) {
        let setData = BubbleChartDataSet(entries: data, label: "Cost")
        let data = BubbleChartData(dataSet: setData)
        setData.colors = chartsColor
        uiView.data = data
        
    }
}
