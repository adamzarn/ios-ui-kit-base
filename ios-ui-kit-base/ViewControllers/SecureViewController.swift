//
//  SecureViewController.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

class SecureViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Keychain.token != nil {
            print("Logged In")
        } else {
            presentLoginViewController(animated: false)
        }
    }
    
    func presentLoginViewController(animated: Bool) {
        DispatchQueue.main.async {
            let loginViewController = LoginViewController.loadFromStoryboard()
            loginViewController.modalPresentationStyle = .fullScreen
            self.present(loginViewController, animated: animated)
        }
    }
}
