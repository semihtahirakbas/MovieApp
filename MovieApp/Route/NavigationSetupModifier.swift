//
//  NavigationSetupModifier.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//
import SwiftUI

struct NavigationSetupModifier: ViewModifier{
    @Binding var navigationStack: [RouterSteps]
    let router: Router
    
    func body(content: Content) -> some View{
        NavigationStack(path: $navigationStack){
            content.navigationDestination(for: RouterSteps.self){ step in
                debugPrint("navigate to: \(step.id)")
                return router.redirect(step)
            }
        }
    }
}

extension View{
    func applyNavigation(_ navigationStack: Binding<[RouterSteps]>, router: Router) -> some View{
        modifier(NavigationSetupModifier(navigationStack: navigationStack, router: router))
    }
}
