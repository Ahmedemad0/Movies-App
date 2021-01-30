//
//  MovieDetails.swift
//  YTS Movie
//
//  Created by Ahmed on 1/26/21.
//

import Foundation
struct MovieDetails: Codable {
    var title: String
    var year: Int
    var TopBackground: String
    var BottomBackground: String
    var poster: String
    var rating: Float
    var trailer: String
    var summery: String
    var cast: [CastModel]?
    enum CodingKeys: String, CodingKey{
        case title = "title_long"
        case year = "year"
        case TopBackground = "small_cover_image"
        case BottomBackground = "large_cover_image"
        case rating = "rating"
        case poster = "medium_cover_image"
        case trailer = "yt_trailer_code"
        case summery = "description_full"
        case cast = "cast"
    }
}
