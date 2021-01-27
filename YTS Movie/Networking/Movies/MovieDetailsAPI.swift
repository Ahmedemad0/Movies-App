//
//  MovieDetailsAPI.swift
//  YTS Movie
//
//  Created by Ahmed on 1/23/21.
//

import Foundation

protocol MovieDetailsProtocolAPI {
    func getMovieDetails(id: Int, Completion: @escaping (resposeDetails?, Error?)-> Void)
}

class MovieDetailsAPI: BaseAPI<MoviesNetworking>, MovieDetailsProtocolAPI{

    func getMovieDetails(id: Int,Completion: @escaping (resposeDetails?, Error?)-> Void){
        self.FetchMovies(target: .getMovieDetails(id), responseClass: resposeDetails.self){ (response,error)  in
            Completion(response, error)
        }
    }
}
