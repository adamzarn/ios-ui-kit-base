//
//  Endpoint.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation

enum Endpoint {
    case login
    case logout
    case getFeed
    
    var path: String {
        switch self {
        case .login: return "/auth/login"
        case .logout: return "/auth/logout"
        case .getFeed: return "/posts/feed"
        }
    }
    
    var httpMethod: String {
        switch self {
        case .login: return "POST"
        case .logout: return "DELETE"
        case .getFeed: return "GET"
        }
    }
    
    var authorization: Authorization {
        switch self {
        case .login: return .basic
        case .logout: return .bearer
        case .getFeed: return .bearer
        }
    }
}