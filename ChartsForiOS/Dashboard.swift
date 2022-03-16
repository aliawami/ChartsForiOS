//
//  Dashboard.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 08/03/2022.
//

import SwiftUI


struct Dashboard: View {
    
    var chartTypes:[ChartColleciton] = [
        ChartColleciton(id:"Bar Char",view:AnyView(ChartsBarView()),imageName: "chart.bar"),
        ChartColleciton(id:"Line Chart",view:AnyView(ChartLineView()), imageName: "chart.xyaxis.line"),
        ChartColleciton(id:"Pie Chart",view:AnyView(ChartPieView()), imageName: "chart.pie.fill"),
        ChartColleciton(id:"H. Bar Chart",view:AnyView(ChartHBarView()),imageName: "chart.bar.doc.horizontal"),
        ChartColleciton(id:"Bar Char1",view:AnyView(ChartsBarView()),imageName: "chart.bar"),
        ChartColleciton(id:"Line Chart1",view:AnyView(ChartLineView()), imageName: "chart.xyaxis.line"),
        ChartColleciton(id:"Pie Chart1",view:AnyView(ChartPieView()), imageName: "chart.pie.fill"),
        ChartColleciton(id:"H. Bar Chart1",view:AnyView(ChartHBarView()),imageName: "chart.bar.doc.horizontal"),
    ]
    
    var gridItem : [GridItem] = [GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))]
    var body: some View {
        NavigationView {
            LazyVGrid(columns: gridItem){
                ForEach(chartTypes, id: \.id){ chartted in
                    ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray,lineWidth: 3)
                                .background(Color.white)
                        VStack{
                            Image(systemName: chartted.imageName)
                                .font(.system(size:  100))
                            Text(chartted.id)
                                .padding()
                        }
                        .foregroundColor(.blue)
                    }
                    .frame(width:200)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(color: .blue, radius: 2, x: 0, y: 3)
                }
            }
            .navigationTitle("Dashboard")
            .toolbar {
                

                ToolbarItem(){
                    Menu {
                        VStack{
                            Button {
                                
                            } label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Create custom chart")
                                }
                                
                            }
                            Button {
                                
                            } label: {
                                HStack {
                                    Image(systemName: "doc.badge.gearshape")
                                    Text("Manage dashboard")
                                        
                                }
                                
                            }
                            .foregroundColor(.green)

                        }
                    } label: {
                        Image(systemName: "plus")
                    } primaryAction: {
                        print("Adding new Chart")
                    }

                }
                
            }
            
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
