//
//  MoviesNetworking.swift
//  YTS Movie
//
//  Created by Ahmed on 1/17/21.
//

import Foundation
import Alamofire


enum MoviesNetworking {
    case getListMovies(Int)
    case getMovieDetails(Int)
}

extension MoviesNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://yts.mx/api/v2"
        }
    }
    
    var pathURL: String {
        switch self {
        case .getListMovies:
            return "/list_movies.json"
        case .getMovieDetails(let id):
            return "/movie_details.json?with_images=true&with_cast=true&movie_id=\(id)"
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .getListMovies:
            return .get
        case .getMovieDetails:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getListMovies:
            return .requestPlain
        case .getMovieDetails:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
}

