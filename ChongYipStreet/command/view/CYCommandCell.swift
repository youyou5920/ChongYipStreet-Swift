//
//  CYCommandCell.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/6.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYCommandCell: UITableViewCell {

    @IBOutlet weak var comeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shoucanButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.comeLabel.text = CYNSLocalizedString("来自")
        
    }
   

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(){
        
    }
    
}
