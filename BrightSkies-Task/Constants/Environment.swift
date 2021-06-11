//
//  Environment.swift
//  BrightSkies-Task
//
//  .
//  Copyright © 2021 . All rights reserved.
//

import Foundation

enum Server {
    case developement
    case staging
    case production
}

class Environment {
    static let server:Server    = .developement
    // To print the log set true.
    static let debug:Bool       =   true
    class func APIBasePath() -> String {
        switch self.server {
            case .developement:
                return "http://api.npoint.io/"
            case .staging:
                return "http://api.npoint.io/"
            case .production:
                return "http://api.npoint.io/"
        }
    }
}
