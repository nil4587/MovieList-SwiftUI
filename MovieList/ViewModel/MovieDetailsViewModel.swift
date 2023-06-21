//
//  MovieDetailsViewModel.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import Foundation
import SwiftUI

struct MovieDetailsViewModel {
    @Binding var selectedMovie: Movie
    
    var imageName: String {
        selectedMovie.image
    }
    
    var title: String {
        selectedMovie.title
    }
    
    var description: String {
        selectedMovie.description
    }
    
    var durationAndGenre: String {
        (selectedMovie.duration) + " - " + (selectedMovie.genre)
    }
    
    var addedToWatchList: Bool {
        selectedMovie.onWatchList
    }
    
    var ratings: String {
        selectedMovie.rating
    }
    
    var genre: String {
        selectedMovie.genre
    }
    
    var releasedDate: String {
        selectedMovie.releasedDate
    }
}
