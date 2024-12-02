//
//  CachedImage.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//

import SwiftUI

struct CachedImage<Content: View>: View{
    
    @StateObject private var manager = CachedImageManager()
    let url: String
    let animation: Animation?
    let transition: AnyTransition
    @ViewBuilder let content: (AsyncImagePhase) -> Content
    
    
    init(url: String,
         animation: Animation? = nil,
         transition: AnyTransition = .identity,
         @ViewBuilder content: @escaping (AsyncImagePhase) -> Content){
        self.url = url
        self.animation = animation
        self.transition = transition
        self.content = content
    }
    
    var body: some View{
        ZStack{
            switch manager.currentState {
            case .loading:
                content(.empty)
                    .transition(transition)
            case .failed(let error):
                content(.failure(error))
                    .transition(transition)
            case .success(let data):
                if let image = UIImage(data: data){
                    content(.success(Image(uiImage: image)))
                        .transition(transition)
                }else{
                    content(.failure(CachedImageError.invalidData))
                        .transition(transition)
                }

            default:
                content(.empty)
                    .transition(transition)
            }
        }
        .animation(animation, value: manager.currentState)
        .task{
            await manager.load(url)
        }
    }
}

struct CachedImagePreview: PreviewProvider{
    static var previews: some View{
        CachedImage(url: "https://m.media-amazon.com/images/M/MV5BM2ZlYjA4NmItZTYxYy00MGFiLTg3MWUtNzZmYjE1ODZmMThjXkEyXkFqcGdeQXVyNTI2NTY2MDI@._V1_.jpg"){ _ in
            EmptyView()
        }
    }
}

extension CachedImage{
    enum CachedImageError: Error{
        case invalidData
    }
}
