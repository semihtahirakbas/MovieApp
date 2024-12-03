//
//  SeeAllDetailView.swift
//  MovieApp
//
//  Created by Tahir Akbas on 29.11.2024.
//

import SwiftUI

struct SeeAllDetailView: View{
    var allMovies: [MovieModel] = []
    @Environment(\.dismiss) var dissmiss
    let columns = Array(repeating: GridItem(.flexible(minimum: 200)), count: 2)
    var body: some View{
        
        ZStack {
            CustomBackgroundView()
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(allMovies, id: \.id){movie in
                        HomeRowFilmItem(movie: movie)
                    }
                }
            }
            Text("Hello").foregroundStyle(.white)
            
        }.navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        dissmiss()
                    }){
                        Label("Deneme", systemImage: "chevron.backward")
                            .foregroundStyle(.white)
                    }.tint(.white)
                }
            }
    }
}
#Preview {
    SeeAllDetailView()
}
