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
    case getRecipes
        
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case .getRecipes:
                return .get
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .getRecipes: return nil
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
                case .getRecipes:
                    return "43427003d33f1f6b51cc"
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
