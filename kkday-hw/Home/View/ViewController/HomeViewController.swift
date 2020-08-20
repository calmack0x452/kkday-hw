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
    
    // MARK: - UIView Life-Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    // MARK: - Member Functions
    
    func initView() {
        
        self.githubUserTableView.dataSource = self
        self.githubUserTableView.delegate = self
        self.githubUserTableView.rowHeight = 78
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: GithubUserTableViewCell = tableView.dequeueReusableCell(withIdentifier: githubUserTableViewCellID, for: indexPath) as! GithubUserTableViewCell
        
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
}
