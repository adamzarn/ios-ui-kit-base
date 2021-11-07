//
//  Notification+Extension.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/6/21.
//

import Foundation
import UIKit

extension Notification {
    var keyboardHeight: CGFloat? {
        let value = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        return value?.cgRectValue.height
    }
}
