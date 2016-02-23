//
//  CYSUserheadView.swift
//  ChongYipStreet
//
//  Created by 颜魏 on 16/2/11.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit
import Kingfisher

protocol CYSUserheadViewDelegate {
    func userheadViewDidSelectTap(view: CYSUserheadView)
}

class CYSUserheadView: UIView {

//    let bgColor = UIColor(red: 235/256.0, green: 83/256.0, blue: 89/256.6, alpha: 1)
    let bgColor = UIColor.redColor()
    
    var _delegate: CYSUserheadViewDelegate?
    var _avatorImageView: UIImageView!
    var _nameLabel: UILabel!
    var _scoreLabel: UILabel!
    var _rankLabel: UILabel!
    var _detailIamgeView: UIImageView!
    
    var _loginUser: CYSUserModel? {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor()
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tap"))
        
        _avatorImageView = UIImageView()
        _avatorImageView.backgroundColor = bgColor
        self.addSubview(_avatorImageView)
        _avatorImageView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.centerY.equalTo(self.snp_centerY)
            make.height.width.equalTo(60)
        }

        _nameLabel = UILabel()
        _nameLabel.backgroundColor = bgColor
        _nameLabel.text = "昵称"
        _nameLabel.textColor = UIColor.whiteColor()
        _nameLabel.font = UIFont.systemFontOfSize(15)
        self.addSubview(_nameLabel)
        _nameLabel.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.snp_centerY)
            make.left.equalTo(_avatorImageView.snp_right).offset(20)
            make.height.equalTo(20)
        }
        
        _detailIamgeView = UIImageView(image: UIImage(named: ""))
        _detailIamgeView.backgroundColor = bgColor
        self.addSubview(_detailIamgeView)
        _detailIamgeView.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-20)
            make.height.width.equalTo(20)
            make.centerY.equalTo(self.snp_centerY)
        }
        
        _scoreLabel = UILabel()
        _scoreLabel.backgroundColor = bgColor
        _scoreLabel.textColor = UIColor.whiteColor()
        _scoreLabel.font = UIFont.systemFontOfSize(15)
        _scoreLabel.text = "积分：0"
        self.addSubview(_scoreLabel)
        _scoreLabel.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(_detailIamgeView.snp_left).offset(-20)
            make.height.equalTo(40)
            make.top.equalTo(0)
        }
        
        _rankLabel = UILabel()
        _rankLabel.backgroundColor = bgColor
        _rankLabel.textColor = UIColor.whiteColor()
        _rankLabel.font = UIFont.systemFontOfSize(15)
        _rankLabel.text = "等级：0"
        self.addSubview(_rankLabel)
        _rankLabel.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(_detailIamgeView.snp_left).offset(-20)
            make.height.equalTo(40)
            make.bottom.equalTo(0)
        }
    }

    func reloadData() {
        _nameLabel.text = _loginUser?.userName
        if let _ = _loginUser {
            _avatorImageView.kf_setImageWithURL(NSURL(string: (_loginUser?.portraitUri)!)!, placeholderImage: UIImage(named: "avator.png"))
            _scoreLabel.text = "积分：" + (_loginUser?.scoring)!
            _rankLabel.text = "等级：" + (_loginUser?.rank)!
        }else {
            _avatorImageView.image = UIImage(named: "avator.png")
            _scoreLabel.text = "积分：0"
            _rankLabel.text = "等级：0"
        }
    }
    
    func tap() {
        _delegate?.userheadViewDidSelectTap(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
