//
//  MovieListRowViewModel.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import Foundation

struct MovieListRowViewModel {
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var imageName: String {
        movie.image
    }
    
    var title: String {
        movie.title
    }
    
    var durationAndGenre: String {
        (movie.duration) + " - " + (movie.genre)
    }
    
    var addedToWatchList: Bool {
        movie.onWatchList
    }
}
