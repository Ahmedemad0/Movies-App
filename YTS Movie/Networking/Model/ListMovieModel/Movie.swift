//
//  Movie.swift
//  YTS Movie
//
//  Created by Ahmed on 1/17/21.
//

import Foundation

struct Movie: Codable {
    var id: Int
    var title: String
    var rating: Float
    var ImageURL: String
    var genres: [String]
    var summery: String
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case title = "title_long"
        case rating = "rating"
        case ImageURL = "medium_cover_image"
        case genres = "genres"
        case summery = "summary"
    }
}
