//
//  FeedViewController.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FeedViewModel()
    let dataSource = FeedTableViewDataSource()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    private func configureNavigationItem() {
        let rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(didSelectLogout))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func configureTableView() {
        viewModel.registerAllCellsAndHeaderFooters(for: tableView)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        tableView.separatorStyle = .none
    }
    
    @objc private func refresh() {
        viewModel.getFeed(completion: { posts in
            DispatchQueue.main.async {
                self.dataSource.posts = posts
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        })
    }
    
    @objc func didSelectLogout() {
        viewModel.logout(onSuccess: {
            self.setNewRootViewController(ofType: LoginViewController.self)
        }, onFailure: { error in
            print(error as Any)
        })
    }
}

