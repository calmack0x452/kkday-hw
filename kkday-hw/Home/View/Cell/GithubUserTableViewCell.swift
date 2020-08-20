//
//  GithubUserTableViewCell.swift
//  kkday-hw
//
//  Created by Mack Liu on 2020/8/20.
//  Copyright © 2020 eBMW Studio. All rights reserved.
//

import UIKit
import Kingfisher

class GithubUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var staffView: UIView!
    @IBOutlet weak var staffLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.staffView.isHidden = true
        self.avatarImage.kf.indicatorType = .activity
        
        self.staffLabel.layer.masksToBounds = true
        self.staffLabel.layer.cornerRadius = self.staffLabel.frame.size.height / 2
        
        self.contentView.clipsToBounds = false
        self.contentView.layer.shadowOpacity = 0.15
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 2, bottom: 8, right: 2))
    }
    
    func setup(viewModel: GithubUserCellViewModel) {
        self.authorName.text = viewModel.authorName
        
        if viewModel.isStaff {
            self.staffView.isHidden = false
        }
        else {
            self.staffView.isHidden = true
        }
        
        if let imageUrl = URL(string: viewModel.avatarUrl) {
            self.avatarImage.kf.setImage(with: imageUrl)
        }
    }
}
