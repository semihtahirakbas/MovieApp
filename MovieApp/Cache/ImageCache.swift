//
//  ImageCache.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//
import Foundation

class ImageCache{
    typealias CacheType = NSCache<NSString, NSData>
    static let instance: ImageCache = ImageCache()
    
    
    init(){
        
    }
    //This is lazy because this will actually not be initialized until directly use this cache here
    private lazy var cache: CacheType = {
        let cache = CacheType()
        //Set the count limit 100 items within it
        cache.countLimit = 100
        cache.totalCostLimit = 50 * 1024 * 1024 // 50MB
        return cache
    }()
    
    //Getting the object from the cache with using key
    func object(forkey key: NSString) -> Data?{
        cache.object(forKey: key) as? Data
    }
    
    //Saving item
    func set(object: NSData, forkey key: NSString){
        cache.setObject(object, forKey: key)
    }
}
