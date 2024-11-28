//
//  ResponseWrapper.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

struct ResponseWrapper<T: Codable>: Codable{
    let results: T
}
