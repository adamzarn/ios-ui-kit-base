//
//  LoginViewModel.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation

class LoginViewModel {
    let network: Network

    var email: String = ""
    var password: String = ""
    
    init(network: Network = Network()) {
        self.network = network
    }
    
    func login(completion: @escaping (LoginResponse?) -> Void) {
        network.login(email: email,
                      password: password,
                      completion: { loginResponse in
            completion(loginResponse)
        })
    }
}
