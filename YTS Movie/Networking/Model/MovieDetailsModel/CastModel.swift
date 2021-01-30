//
//  CastModel.swift
//  YTS Movie
//
//  Created by Ahmed on 1/29/21.
//

import Foundation

struct CastModel: Codable {
    var imageURL: String?
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "url_small_image"
        case name = "name"
    }
}
