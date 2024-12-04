//
//  SwipeBackGesture.swift
//  MovieApp
//
//  Created by Tahir Akbas on 4.12.2024.
//
import UIKit
import SwiftUI

struct SwipeBackGesture: UIViewControllerRepresentable{
    
    var onSwipe:() -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let gestureRecognizer = UIPanGestureRecognizer(target: context.coordinator,
                                                       action: #selector(Coordinator.handlePan))
        viewController.view.addGestureRecognizer(gestureRecognizer)
        
        return viewController
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject{
        var swipedBackGesture: SwipeBackGesture
        
        init(_ swipeBackGesture: SwipeBackGesture){
            self.swipedBackGesture = swipeBackGesture
        }
        
        @objc func handlePan(gestureRecognizer: UIPanGestureRecognizer){
            let translation = gestureRecognizer.translation(in: nil)
            let progress = translation.x / 200
            if gestureRecognizer.state == .ended{
                if progress > 0.5{
                    swipedBackGesture.onSwipe()
                }
            }
        }
    }
}
