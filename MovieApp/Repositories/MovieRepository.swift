//
//  MovieRepository.swift
//  MovieApp
//
//  Created by Tahir Akbas on 29.11.2024.
//

import Alamofire


//MARK: MovieRepository implementation
//Fetching data through NetworkManager object as a response.
//Converting it into [MovieModel] object

class MovieRepository: IRepository{
    final let network: NetworkManager;
    
    static let instance: MovieRepository = .init()
    
    init(network: NetworkManager = NetworkManager.instance){
        self.network = network
    }
    
    func fetchData<T:Codable>(completion: @escaping (Result<T, AFError>) -> Void){
        network.request(url: MovieRepoEndpoints.popular.rawValue){
            (result: Result<T, AFError>) in
            switch result{
            case .success(let data):
                completion(.success(data))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func fetchNewMovies(completion: @escaping(Result<[MovieModel], AFError>) -> Void){
        network.request(url: MovieRepoEndpoints.upComing.rawValue){
            (result: Result<[MovieModel], AFError>) in
            switch result{
            case .success(let data):
                completion(.success(data))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}


enum MovieRepoEndpoints: String{
    case popular = "https://moviesdatabase.p.rapidapi.com/titles"
    case upComing = "https://moviesdatabase.p.rapidapi.com/titles/x/upcoming"
}
