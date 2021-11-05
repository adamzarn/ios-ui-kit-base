//
//  UIViewController+Extension.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    func presentLoginViewController(animated: Bool) {
        DispatchQueue.main.async {
            let loginViewController = LoginViewController.loadFromStoryboard()
            loginViewController.modalPresentationStyle = .fullScreen
            self.present(loginViewController, animated: animated)
        }
    }
}
