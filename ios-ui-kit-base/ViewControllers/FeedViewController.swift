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
    
    @IBAction func didSelectLogout(_ sender: Any) {
        Network().logout(onSuccess: {
            self.presentLoginViewController(animated: true)
        }, onFailure: { error in
            print(error as Any)
        })
    }
}

