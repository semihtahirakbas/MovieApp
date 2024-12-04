//
//  SearchView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 3.12.2024.
//
import SwiftUI

struct SearchView: View{
    @State var query: String = ""
    @StateObject var viewModel: SearchViewModel
    
    @Environment(\.navigationStack)
    var navStack: Binding<[RouterSteps]>
    
    @Environment(\.dismiss)
    var dismiss
    
    
    var body: some View{
        ZStack {
            CustomBackgroundView()
            
            VStack {
                HStack{
                    Button(action: {
                        dismiss()
                    }){
                        Image(systemName: "chevron.backward").padding(.horizontal, 10)
                    }.tint(.white)
                    CustomSearchableTextField(query: $query)
                }
                
                List {
                    ForEach(viewModel.movies.filter { query.isEmpty || $0.titleText.text.localizedCaseInsensitiveContains(query) }) { movie in
                        SearchRowItem(item: movie).onTapGesture{
                            print(navStack.wrappedValue.count)
                            navStack.wrappedValue.append(.movieDetail(item: movie))
                            print(navStack.wrappedValue.count)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .scrollContentBackground(.hidden)
            }
            .navigationBarBackButtonHidden(true)
            
            
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
