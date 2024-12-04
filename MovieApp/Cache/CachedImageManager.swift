//
//  CachedImageManager.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//

import Foundation

final class CachedImageManager: ObservableObject{
    
    //This is marked as private set is because i only want views to be able to listen to changes from this property
    //I don't wanna change it directly
    @Published private(set) var currentState: CurrentState?
    
    private let imageRetriver = ImageRetriver()
    
    
    //When you are making changed to the UI on the main thread, we have to add @MainActor annotation
    @MainActor
    func load(_ imgURL: String, cache: ImageCache = .instance) async{
        self.currentState = .loading
        if let imageData = cache.object(forkey: imgURL as NSString){
            self.currentState = .success(data: imageData)
            //print("Image is loaded from the cache \(imgURL)")
            return
        }
        
        do{
            let data = try await imageRetriver.fetch(imgURL)
            self.currentState = .success(data: data)
            cache.set(object: data as NSData,
                      forkey: imgURL as NSString)
            
            //print("Caching Image")
            
        }catch{
            self.currentState = .failed(error: error)
        }
    }
}


extension CachedImageManager{
    enum CurrentState{
        case loading
        case failed(error: Error)
        case success(data: Data)
    }
}

extension CachedImageManager.CurrentState: Equatable{
    static func == (lhs: CachedImageManager.CurrentState,
                    rhs: CachedImageManager.CurrentState) -> Bool{
        switch(lhs, rhs){
        case(.loading, .loading):
            return true
        case(let .failed(lhsError), let .failed(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (let.success(lhsData), let .success(rhsData)):
            return lhsData == rhsData
        default:
            return false
        }
    }
}
