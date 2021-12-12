//
//  Network.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation

class Network: NetworkManager {
    let api: API
    
    init(api: API = ProdAPI()) {
        self.api = api
    }
    
    func login(email: String,
               password: String,
               completion: @escaping (LoginResponse?) -> Void) {
        guard let request = api.loginRequest(email: email, password: password) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: request,
                                   completionHandler: { data, _, _ in
            guard let data = data else {
                completion(nil); return
            }
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                loginResponse.save()
                completion(loginResponse)
            } catch {
                completion(nil); return
            }
        }).resume()
    }
    
    func logout(onSuccess: @escaping () -> Void,
                onFailure: @escaping (Error?) -> Void) {
        guard let request = api.logoutRequest() else {
            onFailure(nil); return
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
    
    func getFeed(completion: @escaping ([Post]) -> Void) {
        guard let request = api.getFeedRequest() else {
            completion([]); return
        }
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data else {
                completion([]); return
            }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(posts)
            } catch {
                completion([])
            }
        }).resume()
    }
    
    func getProfilePhoto(urlString: String?,
                         completion: @escaping (Data?) -> Void) {
        guard let urlString = urlString else {
            completion(nil); return
        }
        if let data = ImageCache.shared.getData(forKey: urlString) {
            completion(data); return
        }
        guard let urlRequest = api.getProfilePhotoRequest(urlString: urlString) else {
            completion(nil); return
        }
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, _, error in
            guard let data = data else {
                completion(nil)
                return
            }
            ImageCache.shared.setData(data, forKey: urlString)
            completion(data)
        }).resume()
    }
}
