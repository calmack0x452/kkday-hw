//
//  GithubUserCellViewModel.swift
//  kkday-hw
//
//  Created by Mack Liu on 2020/8/20.
//  Copyright © 2020 eBMW Studio. All rights reserved.
//

import UIKit

class GithubUserCellViewModel: NSObject {

    let authorName: String
    let avatarUrl: String
    let isStaff: Bool
    
    init(dataModel: GithubUserModel) {
        
        self.authorName = dataModel.login
        self.avatarUrl = dataModel.avatar_url
        self.isStaff = dataModel.site_admin
    }
}
