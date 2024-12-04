//
//  NavigationSetupModifier.swift
//  MovieApp
//
//  Created by Tahir Akbas on 2.12.2024.
//
import SwiftUI
import UIKit

struct NavigationSetupModifier: ViewModifier{
    @Binding var navigationStack: [RouterSteps]
    @Environment(\.dismiss) var dismiss
    let router: Router
    
    
    func body(content: Content) -> some View{
        NavigationStack(path: $navigationStack){
            content.navigationDestination(for: RouterSteps.self){ step in
#if DEBUG
                debugPrint("navigate to: \(step.id)")
#endif
                return router.redirect(step)
                    .navigationBarBackButtonHidden(true)
                    .toolbar(){
                        ToolbarItem(placement: .topBarLeading){
                            Button(action: {
                                $navigationStack.wrappedValue.removeLast()
                            }){
                                Label("", systemImage: "chevron.backward")
                                    .foregroundStyle(.white)
                            }.tint(.white)
                        }
                    }
            }
        }
    }
}

extension View{
    func applyNavigation(_ navigationStack: Binding<[RouterSteps]>, router: Router) -> some View{
        modifier(NavigationSetupModifier(navigationStack: navigationStack, router: router))
    }
}


extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Ensure the interactive pop gesture recognizer is available and delegate is set
        if let interactivePopGestureRecognizer = self.interactivePopGestureRecognizer {
            interactivePopGestureRecognizer.delegate = self
            interactivePopGestureRecognizer.isEnabled = true
        }
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // Allow pop gesture only if there are more than 1 view controllers in the stack
        return viewControllers.count > 1
    }

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // Allow simultaneous gesture recognition if needed
        return false
    }
}
