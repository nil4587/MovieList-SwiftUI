//
//  MovieListRow.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import SwiftUI

struct MovieListRow: View {
    
    //MARK: - Properties
    
    let viewModel: MovieListRowViewModel
    
    //MARK: - Body
    
    var body: some View {
        HStack(alignment: .center) {
            Image(viewModel.imageName)
                .resizable()
                .frame(width: 80, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.title)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                
                Text(viewModel.durationAndGenre)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                if viewModel.addedToWatchList {
                    Spacer()

                    Text("ON MY WATCHLIST")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .fontWeight(.bold)
                }
            }
            .padding()
        }
    }
}

struct MovieListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRow(viewModel: MovieListRowViewModel(movie: moviesData.first!))
            .previewLayout(.fixed(width: 320, height: 150))
    }
}
