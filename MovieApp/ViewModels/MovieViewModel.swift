//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//
import Foundation
import Alamofire

class MovieViewModel: ObservableObject{
    @Published var movies: [Movie] = []
    let networkManager: NetworkManager = NetworkManager.instance;
    
    init(){
        fetchMovies()
    }
    
    
    func fetchMovies(){
        networkManager.request(url: "https://moviesdatabase.p.rapidapi.com/titles?page=1"){ (result: Result<[Movie], AFError>) in
            switch result{
            case .success(let fetched):
                self.movies = fetched
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
