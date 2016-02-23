//
//  CYSSubjectSecondCollectionViewCell.swift
//  ChongYipStreet
//
//  Created by David Yu on 22/2/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYSSubjectSecondCollectionViewCell: UICollectionViewCell {
    
    var _imageView: UIImageView!
    var _label: UILabel!
    
    var title: String? {
        didSet {
            _label.text = title
        }
    }
    
    var imageName: String? {
        didSet {
            _imageView.image = UIImage(named: imageName!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        _imageView = UIImageView()
        _imageView.backgroundColor = UIColor.redColor()
        _imageView.layer.masksToBounds = true
        _imageView.layer.cornerRadius = 40
        self.contentView.addSubview(_imageView)
        _imageView.snp_makeConstraints(closure: { (make) -> Void in
            make.centerY.equalTo(self.snp_centerY)
            make.width.height.equalTo(80)
            make.left.equalTo(20)
            make.top.equalTo(10)
        })
        
        _label = UILabel()
        _label.font = UIFont.systemFontOfSize(14)
        _label.textAlignment = .Center
        _label.numberOfLines = 2
        self.contentView.addSubview(_label)
        _label.snp_makeConstraints(closure: { (make) -> Void in
            make.centerX.equalTo(self.snp_centerX).offset(30)
            make.height.equalTo(40)
            make.bottom.equalTo(_imageView.snp_bottom)
        })
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
