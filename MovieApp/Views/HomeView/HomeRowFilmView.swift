//
//  HomeRowFilmView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

import SwiftUI

struct HomeRowFilmView: View {
    @StateObject private var movieViewModel = MovieViewModel()
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack{
                ForEach(movieViewModel.movies, id: \._id){
                    movie in HomeRowFilmItem(movie: movie)
                }
            }
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRowFilmView()
    }
}
