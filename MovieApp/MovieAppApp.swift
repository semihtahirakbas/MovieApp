//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//

import SwiftUI

@main
struct MovieAppApp: App {
    private let router = Router()
    
    var body: some Scene {
        let router = Router()
        WindowGroup {
            router.redirect(.home).environment(\.colorScheme, .light)
        }
    }
}


