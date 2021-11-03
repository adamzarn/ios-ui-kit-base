//
//  LoginResponse.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation

struct LoginResponse: Codable {
    let id: String
    let token: String
    let requireEmailVerification: Bool
    let user: User
    
    func save() {
        Keychain.token = token
        UserDefaultsUtility.user = user
    }
}
