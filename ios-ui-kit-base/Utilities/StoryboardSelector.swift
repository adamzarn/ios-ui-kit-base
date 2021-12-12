//
//  StoryboardSelector.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation
import UIKit

class StoryboardSelector {
    let viewControllerIdentifier: String
    
    var storyboard: UIStoryboard? {
        switch viewControllerIdentifier {
        case LoginViewController.identifier,
            MainTabBarController.identifier:
            return getStoryboard(identifier: .main)
        default: return nil
        }
    }
    
    init(viewControllerIdentifier: String) {
        self.viewControllerIdentifier = viewControllerIdentifier
    }
    
    private func getStoryboard(identifier: StoryboardIdentifier) -> UIStoryboard {
        return UIStoryboard(name: identifier.rawValue, bundle: nil)
    }
}
