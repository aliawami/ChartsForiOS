//
//  ChartCombinView.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 09/03/2022.
//

import SwiftUI
import Charts

struct ChartCombinView: View {
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
        CombinedChartViewResponse(lineData: generateLineData(), barData: generateBarData())
    }
    
    
    //: ## function generateLineData
    func generateLineData() -> LineChartData
    {
    //: ### ChartDataEntry
        var entries = [ChartDataEntry]()
        for x in 0 ..< 10{
            entries.append(ChartDataEntry(x: Double(x), y: Double.random(in: 1...3)))
        }
        
    //: ### LineChartDataSet
        let set = LineChartDataSet(entries: entries, label: "Line DataSet")
        set.colors = [#colorLiteral(red: 0.941176470588235, green: 0.933333333333333, blue: 0.274509803921569, alpha: 1.0)]
        set.lineWidth = 1.5
        set.circleColors = [#colorLiteral(red: 0.941176470588235, green: 0.933333333333333, blue: 0.274509803921569, alpha: 1.0)]
        set.circleRadius = 2.0
        set.circleHoleRadius = 0.5
        set.fillColor = #colorLiteral(red: 0.941176470588235, green: 0.933333333333333, blue: 0.274509803921569, alpha: 1.0)
        set.mode = .cubicBezier
        set.drawValuesEnabled = true
        set.valueFont = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        set.valueTextColor = #colorLiteral(red: 0.941176470588235, green: 0.933333333333333, blue: 0.274509803921569, alpha: 1.0)
        set.axisDependency = .left
        
    //: ### LineChartData
        let data = LineChartData()
        data.addDataSet(set)
        return data
    }
    
    func generateLineData2() -> LineChartData
    {
    //: ### ChartDataEntry
        var entries = [ChartDataEntry]()
        for x in 0 ..< 10{
            entries.append(ChartDataEntry(x: Double(x), y: Double.random(in: 1...3)))
        }
        
    //: ### LineChartDataSet
        let set = LineChartDataSet(entries: entries, label: "Line DataSet")
        set.colors = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)]
        set.lineWidth = 1.5
        set.circleColors = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)]
        set.circleRadius = 2.0
        set.circleHoleRadius = 0.5
        set.fillColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        set.mode = .cubicBezier
        set.drawValuesEnabled = true
        set.valueFont = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        set.valueTextColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        set.axisDependency = .left
        
    //: ### LineChartData
        let data = LineChartData()
        data.addDataSet(set)
        return data
    }

    //: ## function generateBarData
    func generateBarData() -> BarChartData
    {
    //: ### BarChartDataEntry
        var entries1 = [BarChartDataEntry]()
        var entries2 = [BarChartDataEntry]()
        
        for _ in 0..<12
        {
            entries1.append(BarChartDataEntry(x: 0.0, y: (Double(arc4random_uniform(25) + 25))))
    /*:
    - Note: stacked
    */
            entries2.append(BarChartDataEntry(x: 0.0, yValues: [Double(arc4random_uniform(13) + 12), Double(arc4random_uniform(13) + 12)]))
        }
        
    //: ### BarChartDataSet
        let set1            = BarChartDataSet(entries: entries1, label: "Bar 1")
        set1.colors         = [#colorLiteral(red: 0.235294117647059, green: 0.862745098039216, blue: 0.305882352941176, alpha: 1.0)]
        set1.valueTextColor = #colorLiteral(red: 0.235294117647059, green: 0.862745098039216, blue: 0.305882352941176, alpha: 1.0)
        set1.valueFont      = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        set1.axisDependency = .right
        
        let set2            = BarChartDataSet(entries: entries2, label: "Bar 2")
        set2.stackLabels    = ["Stack 1", "Stack 2"]
        set2.colors         = [#colorLiteral(red: 0.23921568627451, green: 0.647058823529412, blue: 1.0, alpha: 1.0),  #colorLiteral(red: 0.090196078431373, green: 0.772549019607843, blue: 1.0, alpha: 1.0)]
        set2.valueTextColor = #colorLiteral(red: 0.23921568627451, green: 0.647058823529412, blue: 1.0, alpha: 1.0)
        set2.valueFont      = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        set2.axisDependency = .left
        /*:---*/
    //: ### BarChartData
        let groupSpace = 0.06
        let barSpace = 0.02
        let barWidth = 0.45
        
    /*:
    - Note:  x2 dataset
    (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"
     */
        let data = BarChartData(dataSets: [set1, set2])
        data.barWidth = barWidth
    /*:
    - Note: make this BarData object grouped
    */
        data.groupBars(fromX: 0.0, groupSpace: groupSpace, barSpace: barSpace)     // start at x = 0
        return data
    }

}

struct ChartCombinView_Previews: PreviewProvider {
    static var previews: some View {
        ChartCombinView()
    }
}
