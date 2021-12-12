//
//  NetworkManager.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 12/12/21.
//

import Foundation

protocol NetworkManager {
    var api: API { get }
    func login(email: String,
               password: String,
               completion: @escaping (LoginResponse?) -> Void)
    func logout(onSuccess: @escaping () -> Void,
                onFailure: @escaping (Error?) -> Void)
    func getFeed(completion: @escaping ([Post]) -> Void)
    func getProfilePhoto(urlString: String?,
                         completion: @escaping (Data?) -> Void)
}
