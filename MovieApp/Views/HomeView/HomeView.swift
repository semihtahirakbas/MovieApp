//
//  HomeView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

import SwiftUI

struct HomeView: View{
    
    @StateObject var movieViewModel: MovieViewModel
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
            NavigationStack{
                ZStack{
                    CustomBackgroundView()
                    ScrollView {
                        VStack{
                            HomeRowFilmView(movies: movieViewModel.newMovies, title: "New Movies"){
                                navigationStack.append(.seeAllMovies(movies: movieViewModel.newMovies))
                            }

                            HomeRowFilmView(movies: movieViewModel.movies,title: "Trending" ){
                                navigationStack.append(.seeAllMovies(movies: movieViewModel.movies))
                            }.applyNavigation($navigationStack, router: movieViewModel.router)
                                .padding(.top,20)
                            Spacer()
                            
                        }.padding(.horizontal, 20)
                    }.toolbar{
                        ToolbarItem(placement: .topBarLeading){
                            AvatarComponent(url: "https://avatars.githubusercontent.com/u/41877595?v=4")
                           
                        }
                        ToolbarItem(placement: .topBarTrailing){
                            IconButton(systemName:"magnifyingglass"){
                                
                            }
                        }
                    }

                    .refreshable {
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
    HomeView(movieViewModel: MovieViewModel(router: Router()))
}
