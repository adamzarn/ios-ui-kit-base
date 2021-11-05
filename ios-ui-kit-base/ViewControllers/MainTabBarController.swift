//
//  MainTabBarController.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Keychain.token != nil {
            print("Logged In")
        } else {
            presentLoginViewController(animated: false)
        }
    }
}
