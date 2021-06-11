//
//  APIRouter.swift
//  BrightSkies-Task
//
//  .
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Alamofire


enum APIRouter:URLRequestConvertible {
    case getCategories
    case getNewEpisodes
    case getChannels
        
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case .getCategories,.getChannels,.getNewEpisodes:
                return .get
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .getCategories,.getChannels,.getNewEpisodes:
                return nil
            }
        }()
        
        let url: URL = {
            
            // Add base url for the request
            let baseURL:String = {
                return Environment.APIBasePath()
            }()
                        
            // build up and return the URL for each endpoint
            let relativePath: String? = {
                switch self {
                case .getCategories:
                    return "A0CgArX3"
                case .getNewEpisodes:
                    return "z5AExTtw"
                case .getChannels:
                    return "Xt12uVhM"
                }
            }()
            
            let urlWithAPIVersion = baseURL
            var url = URL(string: urlWithAPIVersion)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        let encoding:ParameterEncoding = {
            return JSONEncoding.default
        }()
        
        let headers:[String:String]? = {
            return nil
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        
        
        return try encoding.encode(urlRequest, with: params)
    }
}
