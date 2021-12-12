//
//  ProdEndpoints.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 12/12/21.
//

import Foundation
import UIKit

enum ProdEndpoints: URLRequestConvertible {
    case login(email: String, password: String)
    case logout
    case getFeed
    case getProfilePhoto(urlString: String)

    var baseUrl: String {
        switch self {
        case .getProfilePhoto(let urlString): return urlString
        default: return "https://vapor-base.herokuapp.com"
        }
    }
    
    var path: String? {
        switch self {
        case .login: return "/auth/login"
        case .logout: return "/auth/logout"
        case .getFeed: return "/posts/feed"
        default: return nil
        }
    }
    
    var httpMethod: String {
        var method: Method = .GET
        switch self {
        case .login: method = .POST
        case .logout: method = .DELETE
        default: method = .GET
        }
        return method.rawValue
    }
    
    var deviceIdHeaderValue: String? {
        switch self {
        case .getProfilePhoto: return nil
        default: return UIDevice.current.identifierForVendor?.uuidString
        }
    }
    
    var authorizationHeaderValue: String? {
        switch self {
        case .login(let email, let password): return getBasicHeaderValue(email, password)
        case .getProfilePhoto: return nil
        default: return getBearerHeaderValue()
        }
    }
        
    var allHTTPHeaderFields: [String: String] {
        var headers: [String: String] = [:]
        if let deviceIdHeaderValue = deviceIdHeaderValue { headers["Device-ID"] = deviceIdHeaderValue }
        if let authorizationHeaderValue = authorizationHeaderValue { headers["Authorization"] = authorizationHeaderValue }
        return headers
    }
    
    var url: URL? {
        var urlString = baseUrl
        urlString += path ?? ""
        return URL(string: urlString)
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.allHTTPHeaderFields = allHTTPHeaderFields
        return urlRequest
    }
    
    private func getBasicHeaderValue(_ email: String, _ password: String) -> String? {
        let emailPasswordString = "\(email):\(password)"
        let base64EncodedEmailPasswordString = Data(emailPasswordString.utf8).base64EncodedString()
        return "Basic \(base64EncodedEmailPasswordString)"
    }
    
    private func getBearerHeaderValue() -> String? {
        guard let token = Keychain.token else { return nil }
        return "Bearer \(token)"
    }
}
