//
//  CYSYWHumanCateView.swift
//  ChongYipStreet
//
//  Created by David Yu on 22/2/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

protocol CYSHumanCateViewDelegate {
    func humanCateView(view: CYSHumanCateView, didSlelectItemIndex index: Int)
}

class CYSHumanCateView: UIView {
    
    var _delegate: CYSHumanCateViewDelegate?
    var _btns = [UIButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        let titles = ["大学生", "社会青年", "资历深厚"]
        let images = ["dxs.png", "shqn.png", "zlsh.png"]
        for i in 0..<titles.count {
            let button = UIButton()
            button.backgroundColor = UIColor.whiteColor()
            button.addTarget(self, action: "actionOnClick:", forControlEvents: .TouchDragInside)
            self.addSubview(button)
            _btns.append(button)
            button.snp_makeConstraints(closure: { (make) -> Void in
                make.top.bottom.equalTo(0)
                make.left.equalTo(Device_Width/3*CGFloat(i))
                make.width.equalTo(Device_Width/3)
            })

            let imageView = UIImageView(image: UIImage(named: images[i]))
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 40
            button.addSubview(imageView)
            imageView.snp_makeConstraints(closure: { (make) -> Void in
                make.centerX.equalTo(button.snp_centerX)
                make.width.height.equalTo(80)
                make.top.equalTo(10)
            })
            
            let label = UILabel()
            label.textAlignment = .Center
            label.text = titles[i]
            button.addSubview(label)
            label.snp_makeConstraints(closure: { (make) -> Void in
                make.centerX.equalTo(button.snp_centerX)
                make.height.equalTo(20)
                make.width.equalTo(button.snp_width)
                make.top.equalTo(imageView.snp_bottom).offset(5)
            })
        }

    }
    
    func actionOnClick(button: UIButton) {
        let index = _btns.indexOf(button)
        _delegate?.humanCateView(self, didSlelectItemIndex: index!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
