//
//  CYProjectCell.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/7.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYProjectCell: UITableViewCell {

    @IBOutlet weak var typeImageView : UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shoucanButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
