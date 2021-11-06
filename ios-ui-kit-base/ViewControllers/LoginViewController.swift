//
//  LoginViewController.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, StoryboardLoadable {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addTarget(self,
                                 action: #selector(emailDidChange(_:)),
                                 for: .editingChanged)
        passwordTextField.addTarget(self,
                                    action: #selector(passwordDidChange(_:)),
                                    for: .editingChanged)
    }
    
    @IBAction func didSelectLogin(_ sender: Any) {
        viewModel.login(completion: { loginResponse in
            guard loginResponse != nil else {
                print("Failure"); return
            }
            self.setNewRootViewController(ofType: MainTabBarController.self)
        })
    }
    
    @objc func emailDidChange(_ textField: UITextField) {
        viewModel.email = textField.text ?? ""
    }
    
    @objc func passwordDidChange(_ textField: UITextField) {
        viewModel.password = textField.text ?? ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
