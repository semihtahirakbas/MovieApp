//
//  IRepository.swift
//  MovieApp
//
//  Created by Tahir Akbas on 29.11.2024.
//
import Alamofire

protocol IRepository{
    func fetchData<T: Codable>(completion: @escaping (Result<T, AFError>) -> Void)
}
