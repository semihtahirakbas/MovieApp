//
//  CustomLoaders.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//
import SwiftUI

struct CustomLoader: View{
    // MARK: - Properties
        @State private var showSpinner:Bool = false
        @State private var degree:Int = 270
        @State private var spinnerLength = 0.6
    var body: some View{
        Circle()
            .trim(from: 0.0,to: spinnerLength)
            .stroke(LinearGradient(colors: [.white, .gray,.black], startPoint: .topLeading, endPoint: .bottomTrailing),style: StrokeStyle(lineWidth: 8.0,lineCap: .round,lineJoin:.round))
            .animation(Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true))
            .frame(width: 60,height: 60)
            .rotationEffect(Angle(degrees: Double(degree)))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear{
                degree = 270 + 360
                spinnerLength = 0
            }
    }
}

#Preview {
    CustomLoader()
}
