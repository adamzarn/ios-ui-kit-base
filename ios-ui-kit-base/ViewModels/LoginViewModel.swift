//
//  LoginViewModel.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation

class LoginViewModel {
    let network: NetworkManager
    
    var keyboardIsShowing: Bool = false
    var email: String = ""
    var password: String = ""
    
    init(network: NetworkManager = Network()) {
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
