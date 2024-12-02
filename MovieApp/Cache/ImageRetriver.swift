//
//  ImageRetriver.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//

import Foundation

struct ImageRetriver{
    func fetch(_ imgURL: String) async throws -> Data{
        
        guard let url = URL(string: imgURL) else{
            //throw error here
            throw RetriverError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}

private extension ImageRetriver{
    enum RetriverError: Error{
        case invalidURL
    }
}
