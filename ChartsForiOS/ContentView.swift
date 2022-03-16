//
//  ContentView.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 07/03/2022.
//

import SwiftUI
import Charts

struct ChartColleciton: Identifiable, Equatable{
    static func == (lhs: ChartColleciton, rhs: ChartColleciton) -> Bool {
        lhs.id == rhs.id
    }
    
    var id:String
    var view: AnyView
    var imageName: String
}

struct ContentView: View {
//    var chartBar = ChartPieView()
    
    var chartTypes:[ChartColleciton] = [
        ChartColleciton(id:"Bar Char",view:AnyView(ChartsBarView()),imageName: "chart.bar"),
        ChartColleciton(id:"Line Chart",view:AnyView(ChartLineView()), imageName: "chart.xyaxis.line"),
        ChartColleciton(id:"Pie Chart",view:AnyView(ChartPieView()), imageName: "chart.pie.fill"),
//        ChartColleciton(id:"Radar Char",view:AnyView(ChartRadarView()), imageName: ""),
//        ChartColleciton(id:"Scatter Chart",view:AnyView(ChartScatterView())),
        ChartColleciton(id:"H. Bar Chart",view:AnyView(ChartHBarView()),imageName: "chart.bar.doc.horizontal"),
//        ChartColleciton(id:"Bubble Chart",view:AnyView(ChartBubblesView())),
//        ChartColleciton(id:"Candle Chart", view:AnyView(ChartCandleStickChart()))
    ]
    
//    var chartTypes = [AnyView(ChartsBarView()),AnyView(ChartLineView()),AnyView(ChartPieView()),AnyView(ChartRadarView()),AnyView(ChartScatterView()),AnyView(ChartHBarView()),AnyView(ChartBubblesView()),AnyView(ChartCandleStickChart())] as [AnyView]
//

//    @State var mainChart:AnyView = AnyView(Text("Select a Chart"))
    @State var selecteditem: ChartColleciton = ChartColleciton(id: "", view: AnyView(Text("Select a Chart")), imageName: "")
    
    var body: some View {
        
        NavigationView{
            VStack{
                Spacer()
                selecteditem.view
//ChartsBarView()
                Spacer()
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(chartTypes, id:\.id) { item in
                            HStack{
                                VStack{
                                    Image(systemName: item.imageName)
                                        .foregroundColor(selecteditem == item ? .blue : .cyan)
//                                        .font(.largeTitle)
                                        .font(.system(size: 45))
                                    
                                    Text(item.id)
                                        .padding()
                                    
//                                    item.view
//                                        .frame(width: 100, height:100)
//                                        .frame(width: 220, height:220)
                                }
                            }
                            .onTapGesture {
                                selecteditem = item
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Charts")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
