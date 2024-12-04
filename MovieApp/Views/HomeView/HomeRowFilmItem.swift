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
                    Text(error.localizedDescription)
                @unknown default:
                    EmptyView()
                }
            }.padding(.horizontal, 4)
           
            Text(movie.originalTitleText.text)
                .fontWeight(.bold)
                .multilineTextAlignment(.trailing)
                .foregroundStyle(.white)
                .frame(maxWidth: 100)
        }
    }
}


