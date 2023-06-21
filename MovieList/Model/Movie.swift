//
//  Movie.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import Foundation

struct Movie: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let rating: String
    let duration: String
    let genre: String
    let releasedDate: String
    let trailerLink: String
    let image: String
    
    var onWatchList: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case description = "Description"
        case rating = "Rating"
        case duration = "Duration"
        case genre = "Genre"
        case releasedDate = "Released date"
        case trailerLink = "Trailer Link"
        case image = "Image"
    }
}

extension Movie: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        rating = try container.decodeIfPresent(String.self, forKey: .rating) ?? ""
        duration = try container.decodeIfPresent(String.self, forKey: .duration) ?? ""
        genre = try container.decodeIfPresent(String.self, forKey: .genre) ?? ""
        releasedDate = try container.decodeIfPresent(String.self, forKey: .releasedDate) ?? ""
        trailerLink = try container.decodeIfPresent(String.self, forKey: .trailerLink) ?? ""
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
    }
}
