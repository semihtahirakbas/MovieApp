//
//  CustomSearchableTextField.swift
//  MovieApp
//
//  Created by Tahir Akbas on 3.12.2024.
//

import SwiftUI

struct CustomSearchableTextField: View {
    @Binding var query: String
    @FocusState private var isFocused: Bool

    var placeholder: String = "Ara..."
    var onCommit: (() -> Void)?

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            TextField("", text: $query, prompt: Text(placeholder)
                .foregroundStyle(.gray))
                .foregroundColor(.white)
                .font(.body)
                .focused($isFocused)
                .onSubmit {
                    onCommit?() // Call onCommit when user presses return
                }
                .disableAutocorrection(true) // Disable autocorrection for search input
                .padding(.vertical, 8)

            if !query.isEmpty {
                Button(action: {
                    query = "" // Clear the text when X is tapped
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding(.horizontal)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
