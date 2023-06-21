//
//  MovieDetailsView.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import SwiftUI

struct MovieDetailsView: View {
    
    //MARK: - Properties
        
    @Binding var movie: Movie
    
    //MARK: - Body
    
    var body: some View {
        List {
            MovieDetailsHeaderView(movie: $movie)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Short Description")
                    .fontWeight(.heavy)
                
                Text(movie.description)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }//: VSTACK
            
            VStack(alignment: .leading) {
                Text("Details")
                    .fontWeight(.heavy)
                
                HStack {
                    VStack(alignment: .trailing, spacing: 8) {
                        Text("Genre")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("Release Date")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }//: VStack
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.genre)
                            .font(.body)
                            .fontWeight(.thin)
                        
                        Text(movie.releasedDate)
                            .font(.body)
                            .fontWeight(.thin)
                    }//: VStack
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }//: HStack
            }//: VSTACK
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//MARK: - Preview

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        @State var movie = moviesData.first!
        MovieDetailsView(movie: $movie)
    }
}
