//
//  CYSeekUserCell.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/7.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYSeekUserCell: UITableViewCell {

    @IBOutlet weak var comeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var personalLabel: UILabel!
    @IBOutlet weak var pContentLabel: UILabel!
    
    @IBOutlet weak var requireLabel: UILabel!
    @IBOutlet weak var rContentLabel: UILabel!
    
    
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.comeLabel.text = CYNSLocalizedString("昵称")
        self.personalLabel.text = CYNSLocalizedString("个人简介")
        self.requireLabel.text = CYNSLocalizedString("用户需求")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
