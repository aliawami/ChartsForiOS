//
//  CustomizeChartView.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 09/03/2022.
//

import SwiftUI

struct CustomizeChartView: View {
    
    @Binding var selecteditem: ChartColleciton
    
    @State private var flipped = false
    @State private var animate3d = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                selecteditem.view
                    .padding()
//                    .frame(height:400)
                    .background(
                        Rectangle()
                            .stroke(Color.gray)
                    )

                Button {
                    withAnimation(Animation.linear(duration: 0.8)) {
                                                  self.animate3d.toggle()
                                            }
                } label: {
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.title)
                }
                .offset(x: -10)
            }
            .opacity(flipped ? 0.0 : 1.0)
            .modifier(FlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis: (x: 0, y: 1)))
            VStack{
                ChartCustomizationView()
                Button {
                    withAnimation(Animation.linear(duration: 0.8)) {
                                                  self.animate3d.toggle()
                                            }
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .opacity(flipped ? 1.0 : 0.0)
            .modifier(FlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis: (x: 0, y: 1)))
                              
        }
        
    }
}

struct CustomizeChartView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeChartView(selecteditem: .constant(ChartColleciton(id:"Vessels",view:AnyView(ChartsBarView()),imageName: "chart.bar")))
    }
}
