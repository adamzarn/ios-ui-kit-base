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
        return post.user.fullName
    }
    
    var timeLabelText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = formatter.date(from: post.createdAt) else { return "" }
        formatter.dateFormat = "M/d/yy h:mm aa"
        return formatter.string(from: date).lowercased()
    }
    
    var postLabelText: String {
        return post.text
    }
    
    init(post: Post,
         network: Network = Network()) {
        self.post = post
        self.network = network
    }
    
    func getProfilePhoto(completion: @escaping (UIImage?) -> Void) {
        network.getProfilePhoto(urlString: post.user.profilePhotoUrl,
                                completion: { data in
            guard let data = data else {
                completion(nil); return
            }
            completion(UIImage(data: data))
        })
    }
}
