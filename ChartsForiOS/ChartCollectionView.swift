//
//  ChartCollectionView.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 09/03/2022.
//

import SwiftUI

struct ChartCollectionView: View {
    var chartTypes:[ChartColleciton] = [
        ChartColleciton(id:"Vessels",view:AnyView(ChartsBarView()),imageName: "chart.bar"),
        ChartColleciton(id:"Captain",view:AnyView(ChartLineView()), imageName: "chart.xyaxis.line"),
        ChartColleciton(id:"Staging",view:AnyView(ChartPieView()), imageName: "chart.pie.fill"),
        ChartColleciton(id:"Shipping",view:AnyView(ChartHBarView()),imageName: "chart.bar.doc.horizontal")]
    @State var selecteditem: ChartColleciton = ChartColleciton(id: "", view: AnyView(Text("Select a Chart")), imageName: "")
    
    var body: some View {
        VStack {
//            HStack{
//                VStack {
//
//                    Text("X-axis")
//                        .fontWeight(.light)
//                    .foregroundColor(.black)
//
//                    Picker(selection: .constant(1), label: Image(systemName: "xmark")) {
//                        Text("Vessel").tag(1)
//                        Text("Rig").tag(2)
//                    }
//                    .pickerStyle(.menu)
//                    .frame(maxWidth:.infinity)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.gray,lineWidth: 1)
//                )
//                }
//                VStack {
//                    Text("Y-axis")
//                        .foregroundColor(Color(uiColor:UIColor.darkGray))
//                        .fontWeight(.light)
//                    Picker(selection: .constant(1), label: Text("Y")) {
//                        Text("Travel").tag(1)
//                        Text("Material").tag(2)
//                    }
//                    .pickerStyle(.menu)
//                    .frame(maxWidth:.infinity)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.gray,lineWidth: 1))
//                }
//
//            }
//            .padding()

            Divider()
            VStack {
                CustomizeChartView(selecteditem: $selecteditem)
//                selecteditem.view
                    .background(
                        Rectangle()
                            .stroke(Color.gray)
                    )
                Divider()
                VStack(alignment: .leading) {
                    Divider()
                    ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(chartTypes, id:\.id) { item in
                                HStack{
                                    VStack{
                                        Image(systemName: item.imageName)
                                            .font(.system(size: 45))
                                        Text(item.id)
                                            .padding()
                                    }
                                    .foregroundColor(selecteditem == item ? .blue : .gray)
                                }
                                .onTapGesture {
                                    selecteditem = item
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .padding(.horizontal)
            .onAppear {
                selecteditem = chartTypes.first!
            }
            .navigationTitle(Text("Charts"))
        }
    }
}

struct ChartCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChartCollectionView()
        }
    }
}
