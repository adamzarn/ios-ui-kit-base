//
//  NibLoadable.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation
import UIKit

protocol NibLoadable {}

extension NibLoadable where Self: UIView {
    static func loadFromNib() -> Self {
        guard let view = Bundle.main.loadNibNamed(reuseIdentifier,
                                                  owner: self,
                                                  options: nil)?.first as? Self else { fatalError() }
        return view
    }
}
