//
//  FeedViewModel.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation
import UIKit

class FeedViewModel: TableViewRegistrationManager {
    var cellNibTypes: [UITableViewCell.Type] = [PostTableViewCell.self]
    let network: NetworkManager
    
    init(network: NetworkManager = Network()) {
        self.network = network
    }
    
    func getFeed(completion: @escaping ([Post]) -> Void) {
        network.getFeed(completion: { posts in
            completion(posts)
        })
    }
    
    func logout(onSuccess: @escaping () -> Void,
                onFailure: @escaping (Error?) -> Void) {
        network.logout(onSuccess: onSuccess, onFailure: onFailure)
    }
}
