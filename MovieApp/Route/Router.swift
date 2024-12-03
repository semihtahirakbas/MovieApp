//
//  Router.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//
import SwiftUI

final class Router: ObservableObject, Identifiable{}

extension Router{
    
    @ViewBuilder
    func redirect(_ step: RouterSteps) -> some View{
        let viewModel = MovieViewModel(router: self)
        switch step{
        case .home:
            HomeView(movieViewModel: viewModel)
        case .seeAllMovies(let movies):
            SeeAllDetailView(allMovies: movies)
                
        }
    }
}
