//
//  CombinedChartViewResponse.swift
//  ChartsBuilding
//
//  Created by Ali Alawami on 01/03/2022.
//

import SwiftUI
import Charts


struct CombinedChartViewResponse : UIViewRepresentable {
    var lineData:LineChartData
    var barData:BarChartData

    func makeUIView(context: Context) -> CombinedChartView {
        CombinedChartView()
    }

    func updateUIView(_ uiView: CombinedChartView, context: Context) {
        
        let setData = CombinedChartData()
        setData.lineData = lineData
        setData.barData = barData
        
        uiView.data = setData
    }
}
