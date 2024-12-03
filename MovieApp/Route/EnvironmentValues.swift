//
//  EnvironmentValues.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//
import SwiftUI

private struct BindingValueKey: EnvironmentKey{
    static let defaultValue: Binding<[RouterSteps]> = .constant([])
}

extension EnvironmentValues{
    var navigationStack: Binding<[RouterSteps]>{
        get{self[BindingValueKey.self]}
        set{self[BindingValueKey.self] = newValue}
    }
}
