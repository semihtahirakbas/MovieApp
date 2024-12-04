//
//  Steps.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//

protocol Steps: Equatable, Hashable{}

enum RouterSteps: Steps{
    case home
    //Getting Collection of [MovieModel] from the parameter.
    case seeAllMovies(movies: [MovieModel])
    case search
    case movieDetail(item: MovieModel)
}

extension RouterSteps: Identifiable{
    var id: String{
        switch self{
        case .home:
            "home"
        case .seeAllMovies:
            "seeAllMovies"
        case .search:
            "search"
        case .movieDetail:
            "movieDetail"
        }
    }
}
