//
//  LoginViewController.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, StoryboardLoadable {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.image = UIImage(named: "logo")
        emailTextField.addTarget(self,
                                 action: #selector(emailDidChange(_:)),
                                 for: .editingChanged)
        passwordTextField.addTarget(self,
                                    action: #selector(passwordDidChange(_:)),
                                    for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startObservingKeyboard(keyboardWillShow: #selector(keyboardWillShow),
                               keyboardWillHide: #selector(keyboardWillHide))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func didSelectLogin(_ sender: Any) {
        viewModel.login(completion: { loginResponse in
            guard loginResponse != nil else {
                print("Failure"); return
            }
            self.setRootViewController(ofType: MainTabBarController.self)
        })
    }
    
    @objc func emailDidChange(_ textField: UITextField) {
        viewModel.email = textField.text ?? ""
    }
    
    @objc func passwordDidChange(_ textField: UITextField) {
        viewModel.password = textField.text ?? ""
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        keyboardWillTransition(toShowing: true, notification: notification)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        keyboardWillTransition(toShowing: false, notification: notification)
    }
    
    private func keyboardWillTransition(toShowing showing: Bool,
                                        notification: Notification) {
        guard viewModel.keyboardIsShowing == !showing,
              let keyboardHeight = notification.keyboardHeight else { return }
        UIView.animate(withDuration: 1, animations: {
            self.view.frame.size.height += (showing ? -1 : 1)*keyboardHeight
            self.view.layoutIfNeeded()
        })
        viewModel.keyboardIsShowing = showing
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
