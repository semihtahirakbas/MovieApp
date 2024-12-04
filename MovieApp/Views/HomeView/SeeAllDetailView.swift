//
//  SeeAllDetailView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 29.11.2024.
//

import SwiftUI

struct SeeAllDetailView: View{
    
    @Environment(\.navigationStack)
    var navigationStack: Binding<[RouterSteps]>
    @Environment(\.dismiss)
    var dismiss
    var allMovies: [MovieModel] = []

    let columns = Array(repeating: GridItem(.flexible(minimum: 200)), count: 2)
    var body: some View{
        
        ZStack {
            
            CustomBackgroundView()
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(allMovies, id: \.id){movie in
                        HomeRowFilmItem(movie: movie)
                            .onTapGesture {
                                navigationStack.wrappedValue.append(.movieDetail(item: movie))
                            }
                    }
                }
                
            }.padding()
           
        }
    }
}
#Preview {
    SeeAllDetailView()
}
