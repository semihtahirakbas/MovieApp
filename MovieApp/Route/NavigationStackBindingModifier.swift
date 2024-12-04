//
//  NavigationStackBindingModifier.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//

import Combine
import SwiftUI

struct NavigationStackBindingModifier: ViewModifier{
    @Binding var navigationsTack: [RouterSteps]
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content.environment(\.navigationStack, $navigationsTack)
    }
}

extension View{
    func navigationStackBinding(_ navigationStack: Binding<[RouterSteps]>) -> some View{
        modifier(NavigationStackBindingModifier(navigationsTack: navigationStack))
        
    }
}
