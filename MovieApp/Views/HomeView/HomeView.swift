//
//  HomeView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

import SwiftUI

struct HomeView: View{
    @StateObject private var movieViewModel = MovieViewModel()
    var body: some View{
        
        switch movieViewModel.pageStatu {
        case .idle:
            ZStack{
                CustomBackgroundView()
                CustomLoader()
            }
        case .loading:
            ZStack{
                CustomBackgroundView()
                CustomLoader()
            }
        case .success:
            NavigationStack {
                ZStack{
                    CustomBackgroundView()
                    ScrollView {
                        VStack{
                            HStack{
                                AvatarComponent(url: "https://avatars.githubusercontent.com/u/41877595?v=4")
                                Spacer()
                                IconButton(systemName: "magnifyingglass") {
                                }
                            }
                            HomeRowFilmView(movies: movieViewModel.newMovies, title: "New Movies").padding(.top,20)
                            HomeRowFilmView(movies: movieViewModel.movies,title: "Trending Now").padding(.top,20)
                            
                            
                            Spacer()
                            
                            
                        }.padding(.horizontal, 20)
                    }.refreshable {
                        movieViewModel.fetchAllMovies()
                    }.onAppear{
                        UIRefreshControl.appearance().tintColor = .white
                    }
                    
                }
            }
        case .failure:
            Text("Error")
        }
        
       
    }
}

#Preview {
    HomeView()
}
