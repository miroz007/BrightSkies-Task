//
//  APIRouter.swift
//  MovieApp
//
//  Created by Amir Samir on 12/11/18.
//  Copyright © 2018 Amir Samir. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

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
                case .getRecipes: return "43427003d33f1f6b51cc"
                }
            }()
            
            var str = ""
            var url : URL!
            if let relativePath = relativePath {
                str = baseURL + relativePath 
                url = URL(string: str)
                
            }
            plog("\(url.absoluteString)")
            
            return url
        }()
        
        let encoding:ParameterEncoding = {
            return JSONEncoding.default
        }()
        let headers:[String:String]? = {
            // AUTH Header
            var header =   [ "Accept" : "application/json" ]
            if let token = UserDefaults.standard.value(forKey: "token") {
                header =   [ "Accept" : "application/json"  , "Authorization" : "\(token)"]
            }
            
            return header
        }()
        print("headers: \(String(describing: headers))")
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return try encoding.encode(urlRequest, with: params)
    }
}


