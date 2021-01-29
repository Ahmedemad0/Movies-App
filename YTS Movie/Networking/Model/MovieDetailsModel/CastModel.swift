//
//  CastModel.swift
//  YTS Movie
//
//  Created by Ahmed on 1/29/21.
//

import Foundation

struct CastModel: Codable {
    var imageURL: String
    
    enum Codingkeys: String, CodingKey {
        case imageURL = "url_small_image"
    }
}
