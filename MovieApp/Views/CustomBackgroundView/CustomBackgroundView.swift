//
//  CustomBackgroundView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

import SwiftUI

struct CustomBackgroundView: View{
    var body: some View{
        ContainerRelativeShape()
            .fill()
            .ignoresSafeArea()
    }
}

#Preview{
    CustomBackgroundView()
}
