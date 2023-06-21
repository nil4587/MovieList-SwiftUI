//
//  Utilities.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import Foundation

//MARK: - Movie Data

let moviesData: [Movie] = {
    Bundle.main.decode("movies.json") ?? []
}()
