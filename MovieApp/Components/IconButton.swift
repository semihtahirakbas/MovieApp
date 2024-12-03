//
//  IconButton.swift
//  MovieApp
//
//  Created by Tahir Akbas on 28.11.2024.
//
import SwiftUI

struct IconButton: View {
    @State var systemName: String
    var onTap: (() -> Void)
    
    // State for the button press animation
    @State private var isPressed: Bool = false

    var body: some View {
        ZStack {
            // Button background with a scaling effect
            Circle()
                .fill(isPressed ? Color.gray.opacity(0.7) : Color.gray.opacity(0.4))
                .scaleEffect(isPressed ? 0.9 : 1.0)
                .animation(.easeInOut(duration: 0.1), value: isPressed)

            // Icon image inside the button
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .padding(8)
                .foregroundStyle(.white)
                .scaleEffect(isPressed ? 0.9 : 1.0)
                .animation(.easeInOut(duration: 0.1), value: isPressed)
        }
         // Adjust size as needed
        .onTapGesture {
            performTapEffect()
            onTap()
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if !isPressed {
                        isPressed = true
                        performHapticFeedback()
                    }
                }
                .onEnded { _ in
                    isPressed = false
                }
        )
    }
    
    /// Provides haptic feedback when the button is pressed
    private func performHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    /// Provides a short visual effect when tapped
    private func performTapEffect() {
        isPressed = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            isPressed = false
        }
    }
}

#Preview {
    IconButton(systemName: "magnifyingglass", onTap: {
        print("Deneme")
    })
}
