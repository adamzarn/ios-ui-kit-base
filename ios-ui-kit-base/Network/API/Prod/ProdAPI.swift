//
//  ProdAPI.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 12/12/21.
//

import Foundation

class ProdAPI: API {
    func loginRequest(email: String, password: String) -> URLRequest? {
        return ProdEndpoints.login(email: email, password: password).urlRequest
    }
    func logoutRequest() -> URLRequest? {
        return ProdEndpoints.logout.urlRequest
    }
    func getFeedRequest() -> URLRequest? {
        return ProdEndpoints.getFeed.urlRequest
    }
    func getProfilePhotoRequest(urlString: String) -> URLRequest? {
        return ProdEndpoints.getProfilePhoto(urlString: urlString).urlRequest
    }
    func getCreatePostRequest(newPost: NewPost) -> URLRequest? {
        return ProdEndpoints.createPost(newPost: newPost).urlRequest
    }
}
