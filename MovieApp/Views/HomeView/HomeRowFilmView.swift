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
    var onNavigate: ()->Void
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(title)
                    .foregroundStyle(.white)
                    .font(Font.system(size: 24))
                    .fontWeight(.medium)
                Spacer()
                Button("See All"){
                    onNavigate()                    
                }.foregroundStyle(.white)
            
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

#Preview {
    HomeRowFilmView(movies: [], title: "Deneme", onNavigate: {
        
    })
}
