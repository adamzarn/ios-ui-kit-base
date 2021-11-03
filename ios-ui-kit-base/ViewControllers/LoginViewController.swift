//
//  LoginViewController.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, StoryboardLoadable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didSelectLogin(_ sender: Any) {
        Network().login(email: "sp@gmail.com",
                        password: "123456",
                        completion: { _ in
            DispatchQueue.main.async {
                self.dismiss(animated: true)
            }
        })
    }
}
