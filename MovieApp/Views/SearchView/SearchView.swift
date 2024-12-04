//
//  SearchView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 3.12.2024.
//
import SwiftUI

import SwiftUI

struct SearchView: View {
    @State var query: String = ""
    @StateObject var viewModel: SearchViewModel
    @Environment(\.navigationStack) var navStack: Binding<[RouterSteps]>
    @Environment(\.dismiss) var dismiss
    @FocusState private var isFocused: Bool  // Focus state for keyboard handling

    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
    
            
                List {
                    ForEach(viewModel.movies.filter { query.isEmpty || $0.titleText.text.localizedCaseInsensitiveContains(query) }) { movie in
                        SearchRowItem(item: movie)
                            .onTapGesture {
                                navStack.wrappedValue.append(.movieDetail(item: movie))
                                isFocused = false // Dismiss keyboard on tap
                            }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .scrollContentBackground(.hidden)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .padding(.horizontal, 10)
                    }
                    .tint(.white)
                }
                ToolbarItem(placement: .principal) {
                    CustomSearchableTextField(query: $query)
                }
            }
            .onTapGesture {
                isFocused = false // Dismiss keyboard when tapping outside
            }
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
