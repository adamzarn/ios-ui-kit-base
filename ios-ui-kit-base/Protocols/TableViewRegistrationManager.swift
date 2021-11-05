//
//  TableViewRegistrationManager.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation
import UIKit

protocol TableViewRegistrationManager {
    var cellClassTypes: [UITableViewCell.Type] { get }
    var cellNibTypes: [UITableViewCell.Type] { get }
    var headerFooterClassTypes: [UITableViewHeaderFooterView.Type] { get }
    var headerFooterNibTypes: [UITableViewHeaderFooterView.Type] { get }
    func registerAllCellsAndHeaderFooters(for tableView: UITableView)
}

extension TableViewRegistrationManager {
    var cellClassTypes: [UITableViewCell.Type] { return [] }
    var cellNibTypes: [UITableViewCell.Type] { return [] }
    var headerFooterClassTypes: [UITableViewHeaderFooterView.Type] { return [] }
    var headerFooterNibTypes: [UITableViewHeaderFooterView.Type] { return [] }
    
    func registerAllCellsAndHeaderFooters(for tableView: UITableView) {
        cellClassTypes.forEach { tableView.registerCellClass(ofType: $0) }
        cellNibTypes.forEach { tableView.registerCellNib(ofType: $0) }
        headerFooterClassTypes.forEach { tableView.registerHeaderFooterClass(ofType: $0) }
        headerFooterNibTypes.forEach { tableView.registerHeaderFooterNib(ofType: $0) }
    }
}
