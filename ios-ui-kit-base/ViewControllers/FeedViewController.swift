//
//  FeedViewController.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import UIKit

class FeedViewController: SecureViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Network().getFeed(completion: { posts in
            print(posts)
        })
    }
    
    @IBAction func didSelectLogout(_ sender: Any) {
        Network().logout(onSuccess: {
            self.presentLoginViewController(animated: true)
        }, onFailure: { error in
            print(error as Any)
        })
    }
}

