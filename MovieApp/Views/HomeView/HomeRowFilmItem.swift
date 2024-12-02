//
//  HomeRowFilmItem.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

import SwiftUI

struct HomeRowFilmItem: View {
    @State var movie: MovieModel
    var body: some View {
        VStack {
            CachedImage(url: movie.primaryImage != nil ? movie.primaryImage!.url : "https://m.media-amazon.com/images/M/MV5BNjJhZjUzODMtZjg4ZS00OTQ3LWFhYjctYzYxZDM5OGNmZWFlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNzg5OTk2OA@@._V1_.jpg", animation: .spring,
                        transition: .scale.combined(with: .opacity)){
                phase in
                switch phase{
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 200)
                case .failure(let error):
                    Text("error")
                @unknown default:
                    EmptyView()
                }
            }.padding(.horizontal, 4)
            /*AsyncImage(url: URL(string: movie.primaryImage != nil ? movie.primaryImage!.url : "https://m.media-amazon.com/images/M/MV5BNjJhZjUzODMtZjg4ZS00OTQ3LWFhYjctYzYxZDM5OGNmZWFlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNzg5OTk2OA@@._V1_.jpg")){
                image in image.image?
                    .resizable()
                    .frame(width: 100, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white.opacity(0.25), lineWidth: 2))
            }.padding(.horizontal, 4)
                .padding(.vertical, 16)*/
            Text(movie.originalTitleText.text)
                .fontWeight(.bold)
                .multilineTextAlignment(.trailing)
                .foregroundStyle(.white)
                .frame(maxWidth: 100)
        }
    }
}


