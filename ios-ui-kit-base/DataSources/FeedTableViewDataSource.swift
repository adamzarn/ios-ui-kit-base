//
//  FeedTableViewDataSource.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/4/21.
//

import Foundation
import UIKit

class FeedTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var posts: [Post]
    
    init(posts: [Post] = []) {
        self.posts = posts
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getCell(ofType: PostTableViewCell.self, for: indexPath) as! PostTableViewCell
        let viewModel = PostTableViewCellViewModel(post: posts[indexPath.row])
        cell.setup(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
