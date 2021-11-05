//
//  File.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation
import UIKit

class PostTableViewCellViewModel {
    let post: Post
    let network: Network
    
    var nameLabelText: String {
        return "\(post.user.firstName) \(post.user.lastName)"
    }
    
    var timeLabelText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = formatter.date(from: post.createdAt) else { return "" }
        formatter.dateFormat = "M/d/yy H:mm"
        return formatter.string(from: date)
    }
    
    var postLabelText: String {
        return post.text
    }
    
    init(post: Post,
         network: Network = Network()) {
        self.post = post
        self.network = network
    }
    
    func getProfilePhoto(urlString: String?,
                         completion: @escaping (UIImage?) -> Void) {
        network.getProfilePhoto(urlString: urlString,
                                completion: { data in
            guard let data = data else {
                completion(nil); return
            }
            completion(UIImage(data: data))
        })
    }
}
