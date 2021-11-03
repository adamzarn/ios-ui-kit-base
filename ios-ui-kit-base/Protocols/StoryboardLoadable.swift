//
//  StoryboardLoadable.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

protocol StoryboardLoadable {}

extension StoryboardLoadable where Self: UIViewController {
    static func loadFromStoryboard() -> Self {
        let storyboard = StoryboardSelector(viewControllerIdentifier: Self.identifier).storyboard
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: Self.identifier) as? Self else { fatalError() }
        return viewController
    }
}
