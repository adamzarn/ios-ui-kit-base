//
//  UITableView+Extension.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation
import UIKit

extension UITableView {
    func getCell<T: UITableViewCell>(ofType type: T.Type,
                                     for indexPath: IndexPath) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T
    }
    
    func getHeaderFooterView<T: UITableViewHeaderFooterView>(ofType type: T.Type) -> UITableViewHeaderFooterView? {
        return dequeueReusableHeaderFooterView(withIdentifier: type.reuseIdentifier) as? T
    }
    
    func registerCellClass<T: UITableViewCell>(ofType type: T.Type) {
        register(type, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    func registerCellNib<T: UITableViewCell>(ofType type: T.Type) {
        let nib = UINib(nibName: type.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    func registerHeaderFooterClass<T: UITableViewHeaderFooterView>(ofType type: T.Type) {
        register(type, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
    
    func registerHeaderFooterNib<T: UITableViewHeaderFooterView>(ofType type: T.Type) {
        let nib = UINib(nibName: type.reuseIdentifier, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
}
