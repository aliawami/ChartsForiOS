//
//  CandleStickChartViewResponse.swift
//  ChartsBuilding
//
//  Created by Ali Alawami on 01/03/2022.
//

import SwiftUI
import Charts


struct CandleStickChartViewResponse : UIViewRepresentable {
    var data:[ChartDataEntry]

    func makeUIView(context: Context) -> CandleStickChartView {
        CandleStickChartView()
    }

    func updateUIView(_ uiView: CandleStickChartView, context: Context) {
        
        let setData = CandleChartDataSet(entries: data, label: "Cost")
        let data = CandleChartData(dataSet: setData)
        setData.colors = chartsColor
        uiView.data = data
    }
}
