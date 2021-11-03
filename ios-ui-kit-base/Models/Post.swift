//
//  Post.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation

struct Post: Codable {
    let id: String
    let text: String
    let createdAt: String
    let user: User
}
