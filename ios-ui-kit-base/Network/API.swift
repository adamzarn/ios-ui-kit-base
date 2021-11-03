//
//  API.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

class API {
    let baseUrl: String
    var email: String?
    var password: String?
    
    init(baseUrl: String = "https://vapor-base.herokuapp.com",
         email: String? = nil,
         password: String? = nil) {
        self.baseUrl = baseUrl
        self.email = email
        self.password = password
    }
    
    func update(withEmail email: String, andPassword password: String) {
        self.email = email
        self.password = password
    }
    
    func getRequest(forEndpoint endpoint: Endpoint) -> URLRequest? {
        guard let url = URL(string: "\(baseUrl)\(endpoint.path)") else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod
        if let authorizationValue = getAuthorizationValue(forEndpoint: endpoint) {
            request.setValue(authorizationValue, forHTTPHeaderField: "Authorization")
        }
        request.setValue(UIDevice.current.identifierForVendor?.uuidString, forHTTPHeaderField: "deviceId")
        return request
    }
    
    private func getAuthorizationValue(forEndpoint endpoint: Endpoint) -> String? {
        switch endpoint.authorization {
        case .basic: return getBasicHeaderValue()
        case .bearer: return getBearerHeaderValue()
        case .none: return nil
        }
    }
    
    private func getBasicHeaderValue() -> String? {
        guard let email = email, let password = password else { return nil }
        let emailPasswordString = "\(email):\(password)"
        let base64EncodedEmailPasswordString = Data(emailPasswordString.utf8).base64EncodedString()
        return "Basic \(base64EncodedEmailPasswordString)"
    }
    
    private func getBearerHeaderValue() -> String? {
        guard let token = Keychain.token else { return nil }
        return "Bearer \(token)"
    }
}
