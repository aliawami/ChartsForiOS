//
//  CommonChartViewResponce.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 07/03/2022.
//

import SwiftUI
import Charts

struct CommonChartViewResponce<T:ChartViewBase>: UIViewRepresentable{
    var data:[ChartDataEntry]

    func makeUIView(context: Context) -> T {
        T()
        
    }

    func updateUIView(_ uiView: T, context: Context) {
        let setData = ChartDataSet(entries: data, label: "Cost")
        let data = ChartData(dataSet: setData)
        setData.colors = chartsColor
        uiView.data = data
        
    }
}
