//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Tahir Akbas on 4.12.2024.
//
import SwiftUI

struct MovieDetailView: View{
    @Environment(\.dismiss) var dismiss
    let item: MovieModel?
    
    var body: some View{
        ZStack{
            if item == nil{
                Text("Boş")
            }
                
            CustomBackgroundView()
            ScrollView {
                VStack(alignment: .leading){
                    MovieHeader(url: item!.primaryImage?.url ?? "")
                    MovieTextFied(title: item!.titleText.text, content: "Lorem ipsum odor amet, consectetuer adipiscing elit. Urna donec imperdiet praesent semper potenti tincidunt. Gravida imperdiet sapien porta; accumsan commodo per adipiscing efficitur. Hendrerit ornare nulla ex, hendrerit aenean inceptos? Purus fermentum primis tempor nunc vivamus suscipit. Quisque conubia tellus diam cubilia auctor habitasse ex bibendum phasellus. Montes litora tempus sem congue est parturient condimentum massa accumsan. Phasellus accumsan posuere molestie finibus id; eu vestibulum fermentum. Litora dolor parturient elementum conubia faucibus consequat nunc tincidunt elementum. Morbi finibus tempus id velit sagittis nullam magna. Sodales libero consequat leo mi ridiculus. Conubia malesuada vehicula penatibus cubilia cursus blandit. Sagittis amet porta quis libero venenatis eget. Velit feugiat in tellus velit felis. Nec magnis enim sollicitudin malesuada ornare consequat; nunc malesuada. Pharetra diam orci facilisis dui ipsum ultrices eros finibus.")
                        
                    Spacer()
                }
            }
            .foregroundStyle(.white)
            .ignoresSafeArea(.all)
        }
    }
}

struct MovieTextFied: View{
    @State var title: String
    @State var content: String
    
    var body: some View{
        VStack(alignment: .leading){
            Text(self.title)
                .font(.title)
                
            Text(self.content)
                .font(.body)
        }.padding()
    }
}

#Preview {
    MovieDetailView(item: nil)
}
