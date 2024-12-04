//
//  MovieHeader.swift
//  MovieApp
//
//  Created by Tahir Akbas on 4.12.2024.
//
import SwiftUI

struct MovieHeader: View{
    let url: String
    var body: some View{
        CachedImage(url: self.url){
            state in
            switch state {
            case .empty:
                EmptyView()
            case .success(let image):
                image.resizable()
                    .frame(height: 200)
                    
            case .failure(let error):
                Text(error.localizedDescription)
            default:
                EmptyView()
            }
        }
    }
}


#Preview {
    MovieHeader(url: "https://th.bing.com/th/id/OIG1.CgTbIrO0vUXLNU28HMdC")
}
