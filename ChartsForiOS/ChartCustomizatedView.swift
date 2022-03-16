//
//  ChartCustomizatedView.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 08/03/2022.
//

import SwiftUI

struct ChartCustomizatedView: View {
//    var chartTypes:[ChartColleciton] = [
//        ChartColleciton(id:"Bar Char",view:AnyView(ChartsBarView()),imageName: "chart.bar"),
//        ChartColleciton(id:"Line Chart",view:AnyView(ChartLineView()), imageName: "chart.xyaxis.line"),
//        ChartColleciton(id:"Pie Chart",view:AnyView(ChartPieView()), imageName: "chart.pie.fill"),
//        ChartColleciton(id:"H. Bar Chart",view:AnyView(ChartHBarView()),imageName: "chart.bar.doc.horizontal")]
    
    var chartTypes:[ChartColleciton] = [
        ChartColleciton(id:"Vessels",view:AnyView(ChartsBarView()),imageName: "chart.bar"),
        ChartColleciton(id:"Captain",view:AnyView(ChartLineView()), imageName: "chart.xyaxis.line"),
        ChartColleciton(id:"Staging",view:AnyView(ChartPieView()), imageName: "chart.pie.fill"),
        ChartColleciton(id:"Shipping",view:AnyView(ChartHBarView()),imageName: "chart.bar.doc.horizontal")]
    @State var selecteditem: ChartColleciton = ChartColleciton(id: "", view: AnyView(Text("Select a Chart")), imageName: "")
    
    var body: some View {
        VStack {
            HStack{
                VStack {
                    
                    Text("X-axis")
                        .fontWeight(.light)
                    .foregroundColor(.black)
                        
                    Picker(selection: .constant(1), label: Image(systemName: "xmark")) {
                        Text("Rig").tag(1)
                        Text("2").tag(2)
                    }
                    .pickerStyle(.menu)
                    .frame(maxWidth:.infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray,lineWidth: 1)
                )
                }
                VStack {
                    Text("Y-axis")
                        .foregroundColor(Color(uiColor:UIColor.darkGray))
                        .fontWeight(.light)
                    Picker(selection: .constant(1), label: Text("Y")) {
                        Text("1").tag(1)
                        Text("2").tag(2)
                    }
                    .pickerStyle(.menu)
                    .frame(maxWidth:.infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray,lineWidth: 1))
                }

            }
            .padding()
            HStack {
                Picker(selection: .constant("Nav Aid"), label: Text("My Custome Selection")) {
                    Text("Nav Aid").tag(1)
                    Text("Captain").tag(2)
                }
                .frame(maxWidth: .infinity)
                .background(
                    VStack{
                        Spacer()
                        Rectangle()
                            .fill(Color.accentColor)
                            .frame(height:1)
                    }
                )
                Button {
                    //Save the presented X and Y axis
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20))
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray,lineWidth: 0.1))
            .padding(.horizontal)

            Divider()
            VStack {
                selecteditem.view
//                    .frame(height:400)
                    .background(
                        Rectangle()
                            .stroke(Color.gray)
                    )
                Divider()
                VStack(alignment: .leading) {
                    Text("Chart type".uppercased())
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(6)
                        .overlay(
                            Rectangle()
                                .stroke(Color.gray,lineWidth: 0.4)
                        )
                        
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
            
        }
    }
}

struct ChartCustomizatedView_Previews: PreviewProvider {
    static var previews: some View {
        ChartCustomizatedView()
    }
}
