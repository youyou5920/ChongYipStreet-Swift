//
//  CYUserHomeHeadView.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/13.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit
protocol CYUserHomeHeadViewDelegate : NSObjectProtocol{
    func goNameCard(userHomeHeadView : CYUserHomeHeadView)
}

class CYUserHomeHeadView: UIView {

    @IBOutlet weak var nameCardButton: UIButton!
    @IBOutlet weak var userImageView: UIImageView!

    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelValue: UILabel!
    
    @IBOutlet weak var FansLabel: UILabel!
    @IBOutlet weak var FansValue: UILabel!
    
    @IBOutlet weak var pageviewsLabel: UILabel!
    @IBOutlet weak var pageviewsValue: UILabel!
    
    weak var delegate : CYUserHomeHeadViewDelegate? = nil
    
    @IBAction func goNameCardAction(sender: UIButton) {
        self.delegate?.goNameCard(self)
    }
    
    static func inituserHomeHeadView() ->CYUserHomeHeadView{
        
        if let userHomeHeadView = NSBundle.mainBundle().loadNibNamed("CYUserHomeHeadView", owner: nil, options: nil).first as? CYUserHomeHeadView {
            
            userHomeHeadView.levelLabel.text = CYNSLocalizedString("等级")
            userHomeHeadView.FansLabel.text = CYNSLocalizedString("粉丝")
            userHomeHeadView.pageviewsLabel.text = CYNSLocalizedString("浏览量")
        
            userHomeHeadView.nameCardButton.layer.cornerRadius = 10
            userHomeHeadView.nameCardButton.layer.borderWidth  = 1
            userHomeHeadView.nameCardButton.layer.borderColor = UIColor.grayColor().CGColor
            userHomeHeadView.nameCardButton.setTitleColor(UIColor.redColor(), forState: .Normal)
            userHomeHeadView.nameCardButton.setTitle(CYNSLocalizedString("个人名片"), forState: .Normal)
            
            return userHomeHeadView
        }
        
        return CYUserHomeHeadView()
    }

}
