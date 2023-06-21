//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import Foundation

enum SortType {
    case sortByTitle
    case sortByReleasedDate
}

class MovieListViewModel: ObservableObject {

    //MARK: - Properties
    
    @Published var sortType: SortType = .sortByTitle {
        didSet {
            if sortType == .sortByTitle {
                movies = movies.sorted(by: {$0.title < $1.title})
            } else {
                movies = movies.sorted(by: {$0.releasedDate < $1.releasedDate})
            }
        }
    }
    
    @Published var movies: [Movie] = {
        moviesData.sorted(by: {$0.title < $1.title})
    }()
        
    //MARK: - Methods
    
    func setSort(by type: SortType) {
        self.sortType = type
    }
}
