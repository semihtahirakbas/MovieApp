//
//  IconButton.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//
import SwiftUI

struct IconButton: View{
    @State var systemName: String
    var onTap: (() -> Void)
    var body: some View{
        Button(action: onTap){
            Image(systemName: systemName)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(10)
        }
        .background(.gray.opacity(0.5))
        .clipShape(.circle)
        .foregroundStyle(.white)
    }
}

#Preview {
    IconButton(systemName: "magnifyingglass", onTap: {
        print("Deneme")
    })
}
