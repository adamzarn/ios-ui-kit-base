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
    
    func setNewRootViewController<T:UIViewController>(ofType type: T.Type) where T:StoryboardLoadable {
        DispatchQueue.main.async {
            self.view.window?.rootViewController = T.loadFromStoryboard()
            self.view.window?.makeKeyAndVisible()
        }
    }
}
