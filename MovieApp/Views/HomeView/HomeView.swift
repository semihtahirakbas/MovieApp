//
//  HomeView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

import SwiftUI

struct HomeView: View{
    
    @ObservedObject var movieViewModel: MovieViewModel
    @State private var navigationStack: [RouterSteps] = []
    
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
            ZStack{
                CustomBackgroundView()
                ScrollView {
                    VStack{
                        HomeRowFilmView(movies: movieViewModel.newMovies, title: "New Movies"){
                            navigationStack.append(.seeAllMovies(movies: movieViewModel.newMovies))
                        }

                        HomeRowFilmView(movies: movieViewModel.movies,title: "Trending" ){
                            navigationStack.append(.seeAllMovies(movies: movieViewModel.movies))
                        }
                        Spacer()
                        
                    }.padding(.horizontal, 20)
                        .padding(.vertical, 20)
                }.toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        AvatarComponent(url: "https://avatars.githubusercontent.com/u/41877595?v=4")
                       
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        IconButton(systemName:"magnifyingglass"){
                            navigationStack.append(.search)
                            print(navigationStack.description)
                        }
                        
                    }
                }

                .refreshable {
                    movieViewModel.fetchAllMovies()
                }.onAppear{
                    UIRefreshControl.appearance().tintColor = .white
                }
                
            }.applyNavigation($navigationStack, router: movieViewModel.router)
                .navigationStackBinding($navigationStack)
        case .failure:
            Text("Error")
        }
        
       
    }
}
