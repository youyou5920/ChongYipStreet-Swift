//
//  CYSMineSecondCollectionViewCell.swift
//  ChongYipStreet
//
//  Created by 颜魏 on 16/2/12.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit


class CYSMineSecondCollectionViewCell: UICollectionViewCell {
    
    var _imageView: UIImageView!
    var _titleLabel: UILabel!

    var title: String? {
        didSet {
            _titleLabel.text = title
        }
    }
    var imageName: String? {
        didSet {
            _imageView.image = UIImage(named: imageName!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.whiteColor()
        
        _imageView = UIImageView()
        _imageView.backgroundColor = UIColor.whiteColor()
        self.addSubview(_imageView)
        _imageView.snp_makeConstraints { (make) -> Void in
            make.top.left.equalTo(10)
            make.width.height.equalTo(60)
        }
        
        _titleLabel = UILabel()
        _titleLabel.backgroundColor = UIColor.whiteColor()
        _titleLabel.font = UIFont.systemFontOfSize(14)
        _titleLabel.numberOfLines = 0;
        self.addSubview(_titleLabel)
        _titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(_imageView.snp_right).offset(10)
            make.right.equalTo(0)
            make.height.equalTo(40)
            make.centerY.equalTo(self.contentView.snp_centerY)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
