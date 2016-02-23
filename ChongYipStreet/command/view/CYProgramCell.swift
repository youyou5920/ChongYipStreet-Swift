//
//  CYProgramCell.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/7.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYProgramCell: UITableViewCell {

    @IBOutlet weak var comeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shoucanButton: UIButton!
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.comeLabel.text = CYNSLocalizedString("来自")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
