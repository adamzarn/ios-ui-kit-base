//
//  NotificationCenter+Extension.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/6/21.
//

import Foundation

extension NotificationCenter {
    func addObserver(_ observer: Any, selector: Selector, name: NSNotification.Name?) {
        addObserver(observer, selector: selector, name: name, object: nil)
    }
}
