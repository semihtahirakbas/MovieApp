//
//  HomeRowFilmView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

import SwiftUI

struct HomeRowFilmView: View {
    let movies: [MovieModel]
    @State var title: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(title)
                    .foregroundStyle(.white)
                    .font(Font.system(size: 24))
                    .fontWeight(.medium)
                Spacer()
                NavigationLink{
                    SeeAllDetailView(allMovies: movies)
                } label:{
                    Text("See All")
                }
                .foregroundStyle(.gray)
            
            }
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(movies, id: \._id){
                        movie in HomeRowFilmItem(movie: movie)
                    }
                }
            }.padding(0)
        }
       
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRowFilmView(movies: [], title: "Deneme")
    }
}
