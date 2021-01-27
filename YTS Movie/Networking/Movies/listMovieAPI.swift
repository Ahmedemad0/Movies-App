//
//  listMovieAPI.swift
//  YTS Movie
//
//  Created by Ahmed on 1/17/21.
//

import Foundation

protocol listMovieProtocolAPI {
    func getMovies(page: Int, Completion: @escaping (MovieResponse?, Error?)-> Void)
}

class listMovieAPI: BaseAPI<MoviesNetworking>, listMovieProtocolAPI{
    func getMovies(page: Int, Completion: @escaping (MovieResponse?, Error?)-> Void){
        self.FetchMovies(target: .getListMovies(page), responseClass: MovieResponse.self){ (response,error)  in
            Completion(response, error)
        }
    }
}
