//
//  HomeViewController.swift
//  kkday-hw
//
//  Created by Mack Liu on 2020/8/20.
//  Copyright © 2020 eBMW Studio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UI Component Property
    
    @IBOutlet weak var githubUserTableView: UITableView!
    
    // MARK: - Member Variables
    
    let githubUserTableViewCellID = "GithubUserTableViewCell"
    var cellViewModels = [GithubUserCellViewModel]()
    
    // MARK: - UIView Life-Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        buildViewModel()
    }
    
    // MARK: - Member Functions
    
    func initView() {
        
        self.githubUserTableView.dataSource = self
        self.githubUserTableView.delegate = self
        self.githubUserTableView.rowHeight = 78
    }
    
    func buildViewModel() {
        
        APIService.fetchSource(urlString: "https://api.github.com/users?page=1&per_page=100",
                                  type: [GithubUserModel].self) { (responseObject) in

            for userModel in responseObject {
                let cellViewModel = GithubUserCellViewModel.init(dataModel: userModel)
                self.cellViewModels.append(cellViewModel)
            }
                                    
            self.githubUserTableView.reloadData()
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: githubUserTableViewCellID, for: indexPath)
        
        if let cell = cell as? GithubUserTableViewCell {
            cell.setup(viewModel: cellViewModel)
        }
        
        return cell
    }
}
