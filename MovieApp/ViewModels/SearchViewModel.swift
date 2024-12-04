//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Tahir Akbas on 3.12.2024.
//
import Foundation
import Alamofire
class SearchViewModel: ObservableObject{
    
    @Published var movies: [MovieModel] = []
    @Published var error: AFError?
    @Published var pageStatu: PageStatu = .idle
    @Published var filteredMovies: [MovieModel] = []
    
    private let movieRepo: MovieRepository = MovieRepository.instance
    
    init() {
        fetchAllMovies()
    }
    
    
    private func fetchAllMovies(){
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
                
            }
        }
    }
    
    func searchMovie(query: String){
        filteredMovies = movies.filter(){
            movie in
            movie.titleText.text.contains(query)
        }
    }
    
    
}
