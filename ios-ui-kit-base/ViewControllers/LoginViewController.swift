//
//  LoginViewController.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, StoryboardLoadable {
    
    var viewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didSelectLogin(_ sender: Any) {
        viewModel.login(completion: { loginResponse in
            guard loginResponse != nil else {
                print("Failure"); return
            }
            self.setNewRootViewController(ofType: MainTabBarController.self)
        })
    }
}
