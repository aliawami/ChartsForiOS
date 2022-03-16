//
//  ChartCollectionMainView.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 09/03/2022.
//

import SwiftUI

struct ChartCollectionMainView: View {
    var chartTypes:[ChartColleciton] = [
        ChartColleciton(id:"Vessels",view:AnyView(ChartsBarView()),imageName: "chart.bar"),
        ChartColleciton(id:"Captain",view:AnyView(ChartLineView()), imageName: "chart.xyaxis.line"),
        ChartColleciton(id:"Staging",view:AnyView(ChartPieView()), imageName: "chart.pie.fill"),
        ChartColleciton(id:"Shipping",view:AnyView(ChartHBarView()),imageName: "chart.bar.doc.horizontal"),
        ChartColleciton(id:"Vessel/time",view:AnyView(ChartsBarView()),imageName: "chart.bar"),
        ChartColleciton(id:"Staging/Shipping",view:AnyView(ChartLineView()), imageName: "chart.xyaxis.line"),]
    
    @State var selecteditem: ChartColleciton = ChartColleciton(id: "", view: AnyView(Text("Select a Chart")), imageName: "")
    
    var gridItem : [GridItem] = [GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))]
    @State var displayType: Int = 1
    var body: some View {
        NavigationView {
            
            VStack {
                Picker(selection: $displayType, label: Text("Display Style")) {
                    Image(systemName: "square.grid.2x2").tag(1)
                    Image(systemName: "list.dash").tag(2)
                }
                .pickerStyle(.segmented)
                if displayType == 1{
                LazyVGrid(columns: gridItem, alignment: .center){
                    ForEach(chartTypes, id: \.id){ chartted in
                        NavigationLink {
                            ChartCollectionView(selecteditem:chartted)
                        } label: {
                            ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.gray,lineWidth: 3)
                                        .background(Color.white)
                                VStack{
                                    chartted.view
                                        .frame(height: 100)
                                    Text(chartted.id)
                                        .font(.title2)
                                        .padding()
                                }
                                .foregroundColor(.blue)
                            }
                            .frame(width:200)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .shadow(color: .blue, radius: 2, x: 0, y: 3)
                        }

                        
                    }
                    
                }
                .frame(maxHeight: .infinity)
                }else{
                    List {
                        ForEach(chartTypes, id: \.id){ chartted in
                            NavigationLink {
                                ChartCollectionView(selecteditem:chartted)
                            } label: {
                                    HStack{
                                        chartted.view
                                            .frame(width: 110, height: 100)
                                        Text(chartted.id)
                                            .padding()
                                    }
                                    .foregroundColor(.blue)
                            }
                        }
                    }
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

struct ChartCollectionMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChartCollectionMainView()
    }
}
