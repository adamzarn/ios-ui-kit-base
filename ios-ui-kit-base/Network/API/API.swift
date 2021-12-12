//
//  API.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

protocol API {
    func loginRequest(email: String, password: String) -> URLRequest?
    func logoutRequest() -> URLRequest?
    func getFeedRequest() -> URLRequest?
    func getProfilePhotoRequest(urlString: String) -> URLRequest?
}
