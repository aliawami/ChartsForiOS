//
//  MultiViewDashboard.swift
//  ChartsForiOS
//
//  Created by Ali Alawami on 08/03/2022.
//

import SwiftUI

struct MultiViewDashboard: View {
    var body: some View {
        VStack {
            ChartsBarView()
                .frame(height:400)
                .background(
                    Rectangle()
                        .stroke(Color.gray)
                )
            HStack{
                ChartLineView()
                    .padding()
                    .background(
                        Rectangle()
                            .stroke(Color.gray)
                    )
                    
                    
                ChartPieView()
                    .padding()
                    .background(
                        Rectangle()
                            .stroke(Color.gray)
                    )
            }
            .frame(height:200)
            
            
        }
        .padding(.horizontal)
    }
}

struct MultiViewDashboard_Previews: PreviewProvider {
    static var previews: some View {
        MultiViewDashboard()
    }
}
