//
//  Network.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation

class Network {
    let api: API
    
    init(api: API = API()) {
        self.api = api
    }
    
    func login(email: String,
               password: String,
               completion: @escaping (LoginResponse?) -> Void) {
        api.update(withEmail: email, andPassword: password)
        guard let request = api.getRequest(forEndpoint: .login) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: request,
                                   completionHandler: { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(nil)
                return
            }
            loginResponse.save()
            completion(loginResponse)
        }).resume()
    }
    
    func logout(onSuccess: @escaping () -> Void,
                onFailure: @escaping (Error?) -> Void) {
        guard let request = api.getRequest(forEndpoint: .logout) else {
            onFailure(nil)
            return
        }
        URLSession.shared.dataTask(with: request, completionHandler: { _, _, error in
            if let error = error {
                onFailure(error)
            } else {
                Keychain.clear()
                UserDefaultsUtility.clear()
                onSuccess()
            }
        }).resume()
    }
}
