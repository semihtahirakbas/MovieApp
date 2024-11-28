//
//  AvatarComponent.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//
import SwiftUI
struct AvatarComponent: View{
    @State var url: String
    
    var body: some View{
        AsyncImage(url: URL(string: url)){
            image in image.image?
                .resizable()
                .clipShape(.circle)
                .overlay(Circle().stroke(.white, lineWidth: 2))
                .frame(width: 42, height: 42)
        }
    }
}

#Preview{
    AvatarComponent(url: "https://avatars.githubusercontent.com/u/41877595?v=4")
}
