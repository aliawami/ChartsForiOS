//
//  BarChartViewResponse.swift
//  ChartsBuilding
//
//  Created by Ali Alawami on 01/03/2022.
//

import SwiftUI
import Charts


struct BarChartViewResponse : UIViewRepresentable {
    var data:[BarChartDataEntry]

    func makeUIView(context: Context) -> BarChartView {
        BarChartView()
    }

    func updateUIView(_ uiView: BarChartView, context: Context) {
        let setData = BarChartDataSet(entries: data, label: "Cost")
        let data = BarChartData(dataSet: setData)
        setData.colors = chartsColor
        uiView.data = data
    }
}

