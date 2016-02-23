//
//  CYSProject2TableHeadView.swift
//  ChongYipStreet
//
//  Created by David Yu on 22/2/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

protocol CYSProject2TableHeadViewDelegate {
    func project2TableHeadView(view: CYSProject2TableHeadView, didSelectItemWithIndex index: Int)
    func project2TableHeadViewDidSelectBack()
}

class CYSProject2TableHeadView: UIView {
    
    var _delegate: CYSProject2TableHeadViewDelegate?
    
    var _collectionView: UICollectionView!
    var _titles = [String]()
    var _images = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor()
        _titles = ["类型", "团队", "人数", "资金"]
        _images = ["type.png", "team.png", "human_nums.png", "cash.png"]
        
        let label = UILabel()
        label.textColor = UIColor.whiteColor()
        label.text = "创业街"
        label.font = UIFont.systemFontOfSize(30)
        self.addSubview(label)
        label.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(40)
            make.centerX.equalTo(self.snp_centerX)
            make.height.equalTo(30)
        })
        
        let button = UIButton()
        button.setImage(UIImage(named: "my_project.png"), forState: .Normal)
        button.addTarget(self, action: "actionBack", forControlEvents: .TouchUpInside)
        self.addSubview(button)
        button.snp_makeConstraints(closure: { (make) -> Void in
            make.width.height.equalTo(40)
            make.left.equalTo(20)
            make.top.equalTo(40)
        })
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(Device_Width/4, 100)
        
        _collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        _collectionView.registerClass(CYSMineMeansCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "item")
        _collectionView.backgroundColor = UIColor.clearColor()
        _collectionView.delegate = self
        _collectionView.dataSource = self
        _collectionView.scrollEnabled = false
        _collectionView.showsHorizontalScrollIndicator = false
        self.addSubview(_collectionView)
        _collectionView.snp_makeConstraints(closure: { (make) -> Void in
            make.bottom.left.right.equalTo(0)
            make.height.equalTo(100)
        })

    }
    
    func actionBack() {
        _delegate?.project2TableHeadViewDidSelectBack()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CYSProject2TableHeadView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! CYSMineMeansCollectionViewCell
        cell.title = _titles[indexPath.item]
        cell.imageName = _images[indexPath.item]
        cell.textColor = UIColor.whiteColor()
        cell.bgColor = UIColor.redColor()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        _delegate?.project2TableHeadView(self, didSelectItemWithIndex: indexPath.row)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}

