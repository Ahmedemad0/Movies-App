//
//  Movie.swift
//  YTS Movie
//
//  Created by Ahmed on 1/17/21.
//

import Foundation

struct Data: Codable {
    var moviecount: Int
    var limit: Int
    var movies: [Movie]
    var pageNumber: Int
    
    enum CodingKeys: String, CodingKey {
        case moviecount = "movie_count"
        case limit = "limit"
        case movies = "movies"
        case pageNumber = "page_number"
    }
}
