//
//  PieChartViewResponse.swift
//  ChartsBuilding
//
//  Created by Ali Alawami on 01/03/2022.
//

import SwiftUI
import Charts


struct PieChartViewResponse: UIViewRepresentable{
    var data:[ChartDataEntry]

    func makeUIView(context: Context) -> PieChartView {
        PieChartView()
        
    }

    func updateUIView(_ uiView: PieChartView, context: Context) {
        let setData = PieChartDataSet(entries: data, label: "Cost")
        let data = PieChartData(dataSet: setData)
        setData.colors = chartsColor
        uiView.data = data
        
    }
}
