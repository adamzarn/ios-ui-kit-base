//
//  UIView+Extension.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation
import UIKit

extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
