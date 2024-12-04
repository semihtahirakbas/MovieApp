//
//  SearchRowItem.swift
//  MovieApp
//
//  Created by Tahir Akbas on 3.12.2024.
//
import SwiftUI

struct SearchRowItem: View{
    let item: MovieModel
    var body: some View{
        HStack{
            CachedImage(url: item.primaryImage != nil ? item.primaryImage!.url : "https://m.media-amazon.com/images/M/MV5BNjJhZjUzODMtZjg4ZS00OTQ3LWFhYjctYzYxZDM5OGNmZWFlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNzg5OTk2OA@@._V1_.jpg", animation: .spring,
                        transition: .scale.combined(with: .opacity)){
                phase in
                switch phase{
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 200)
                case .failure(_):
                    Text("error")
                @unknown default:
                    EmptyView()
                }
            }.padding(.horizontal, 4)
            Text(item.titleText.text)
                .foregroundStyle(.white)
        }
       
    }
}


