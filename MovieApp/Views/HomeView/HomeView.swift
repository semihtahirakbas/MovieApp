//
//  HomeView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

import SwiftUI

struct HomeView: View{
    var body: some View{
        ZStack{
            CustomBackgroundView()
            
            VStack {
                HStack{
                    AvatarComponent(url: "https://avatars.githubusercontent.com/u/41877595?v=4")
                    Spacer()
                    IconButton(systemName: "magnifyingglass") {
                    }
                }
                Spacer()
            }.padding(.horizontal, 20)
        }
    }
}

#Preview{
    HomeView()
}
