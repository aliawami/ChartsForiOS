//
//  RadarChartViewResponse.swift
//  ChartsBuilding
//
//  Created by Ali Alawami on 01/03/2022.
//

import SwiftUI
import Charts


struct RadarChartViewResponse : UIViewRepresentable {
    var data:[ChartDataEntry]

    func makeUIView(context: Context) -> RadarChartView {
        RadarChartView()
    }

    func updateUIView(_ uiView: RadarChartView, context: Context) {
        let setData = RadarChartDataSet(entries: data, label: "Cost")
        let data = RadarChartData(dataSet: setData)
        setData.colors = chartsColor
        uiView.data = data
    }
}
