//
//  CYSMineMeansCollectionViewCell.swift
//  ChongYipStreet
//
//  Created by 颜魏 on 16/2/11.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYSMineMeansCollectionViewCell: UICollectionViewCell {
    
    var _imageView: UIImageView!
    var _titleLabel: UILabel!
    
    var bgColor: UIColor? {
        didSet {
            self.contentView.backgroundColor = bgColor
//            _imageView.backgroundColor = bgColor
            _titleLabel.backgroundColor = bgColor
        }
    }
    var textColor: UIColor? {
        didSet {
            _titleLabel.textColor = textColor
        }
    }
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
        
        _titleLabel = UILabel()
        _titleLabel.backgroundColor = UIColor.whiteColor()
        _titleLabel.font = UIFont.systemFontOfSize(14)
        self.addSubview(_titleLabel)
        _titleLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.snp_centerX)
            make.height.equalTo(30)
            make.bottom.equalTo(0)
        }

        _imageView = UIImageView()
        self.addSubview(_imageView)
        _imageView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.snp_centerX)
            make.width.height.equalTo(40)
            make.bottom.equalTo(_titleLabel.snp_top)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
