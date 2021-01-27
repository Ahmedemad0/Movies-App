//
//  BaseAPI.swift
//  YTS Movie
//
//  Created by Ahmed on 1/17/21.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    func FetchMovies<M: Decodable>(target: T, responseClass: M.Type, completion: @escaping(M?,Error?)-> Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        AF.request(target.baseURL + target.pathURL, method: method, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response ) in
            guard let statusCode = response.response?.statusCode else {
                print("statusCodeerror")
                completion(nil,CustomError(title: "Status Code Error", description: "Status Code Error", code: 1000))
                return
            }
            if statusCode == 200 {
                
                guard let data = response.data else {
                    completion(nil,CustomError(title: "Failed getting Data", description: "Failed getting Data", code: 4000))
                    return
                    
                }
                guard let responseOBJ = try? JSONDecoder().decode(M.self, from: data) else {
                    print("responseOBJerror")
                    completion(nil,CustomError(title: "Failed Decoding", description: "Failed Decoding", code: 3000))
                    return
                }
                completion(responseOBJ,nil)
            }else {
                print("requesterror")
                completion(nil,CustomError(title: "Request Error", description: "Request Error", code: 2000))

            }
        }
    }
    
    
    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
}
