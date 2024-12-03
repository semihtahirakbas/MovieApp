//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//
import Foundation
import Alamofire

class MovieViewModel: ObservableObject{
    unowned var router: Router
    @Published var movies: [MovieModel] = []
    @Published var newMovies: [MovieModel] = []
    @Published var error: AFError?
    @Published var pageStatu: PageStatu = .idle
    
    private let movieRepo: MovieRepository = MovieRepository.instance
    
    init(router: Router){
        self.router = router
        fetchAllMovies()
        
    }
    
    
    func fetchAllMovies(){
        pageStatu = .loading
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        movieRepo.fetchData{
            (result: Result<[MovieModel], AFError>) in
            
            DispatchQueue.main.async{
                switch result{
                case .success(let fetchedMovies):
                    self.movies = fetchedMovies
                case .failure(let error):
                    self.error = error
                    self.pageStatu = .failure
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        movieRepo.fetchNewMovies{
            (result: Result<[MovieModel], AFError>) in
            DispatchQueue.main.async{
                switch result{
                case .success(let fetchedMovies):
                    self.newMovies = fetchedMovies
                case .failure(let error):
                    self.error = error
                    self.pageStatu = .failure
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main){
            self.pageStatu = .success
            print("All movies fetched")
        }
    }
    
}


enum PageStatu: String{
    case idle,loading, success, failure
}
