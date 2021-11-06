//
//  UIWindow+Extension.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation
import UIKit

extension UIWindow {
    func setRootViewController<T:UIViewController>(ofType type: T.Type) where T:StoryboardLoadable {
        DispatchQueue.main.async {
            self.rootViewController = T.loadFromStoryboard()
            self.makeKeyAndVisible()
        }
    }
}
