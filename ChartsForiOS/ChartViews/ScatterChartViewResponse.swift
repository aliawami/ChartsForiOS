//
//  ScatterChartViewResponse.swift
//  ChartsBuilding
//
//  Created by Ali Alawami on 01/03/2022.
//

import SwiftUI
import Charts


struct ScatterChartViewResponse : UIViewRepresentable {
    var data:[ChartDataEntry]

    func makeUIView(context: Context) -> ScatterChartView {
        ScatterChartView()
    }

    func updateUIView(_ uiView: ScatterChartView, context: Context) {
        let setData = ScatterChartDataSet(entries: data, label: "Cost")
        let data = ScatterChartData(dataSet: setData)
        setData.colors = chartsColor
        uiView.data = data
    }
}
