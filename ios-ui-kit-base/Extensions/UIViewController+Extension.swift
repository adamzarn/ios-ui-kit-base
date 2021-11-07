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
    
    func setRootViewController<T:UIViewController>(ofType type: T.Type) where T:StoryboardLoadable {
        DispatchQueue.main.async {
            self.view.window?.setRootViewController(ofType: type)
        }
    }
    
    func startObservingKeyboard(keyboardWillShow: Selector? = nil,
                                keyboardDidShow: Selector? = nil,
                                keyboardWillHide: Selector? = nil,
                                keyboardDidHide: Selector? = nil) {
        if let keyboardWillShow = keyboardWillShow {
            observe(UIResponder.keyboardWillShowNotification, selector: keyboardWillShow)

        }
        if let keyboardDidShow = keyboardDidShow {
            observe(UIResponder.keyboardDidShowNotification, selector: keyboardDidShow)

        }
        if let keyboardWillHide = keyboardWillHide {
            observe(UIResponder.keyboardWillHideNotification, selector: keyboardWillHide)

        }
        if let keyboardDidHide = keyboardDidHide {
            observe(UIResponder.keyboardDidHideNotification, selector: keyboardDidHide)
        }
    }
    
    func observe(_ name: NSNotification.Name?, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name)
    }
}
