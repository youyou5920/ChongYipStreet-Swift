//
//  CYSUSerMeansView.swift
//  ChongYipStreet
//
//  Created by 颜魏 on 16/2/11.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

protocol CYSUserMeansViewDelegate {
    func userMeansViewDidSelect(view: CYSUserMeansView, withIndex index: Int)
}

class CYSUserMeansView: UIView {

//    let bgColor = UIColor(red: 235/256.0, green: 83/256.0, blue: 89/256.6, alpha: 1)
    let bgColor = UIColor.redColor()

    var _delegate: CYSUserMeansViewDelegate?
    var _collectionView: UICollectionView!
    var _titles: [String] = []
    var _imageNames: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = bgColor
        _titles = ["我的自媒体", "我的帖子", "个人主页"]
        _imageNames = ["my_medial.png", "my_teizi.png", "my_project.png"]
        
        let flaw = UICollectionViewFlowLayout()
        flaw.itemSize = CGSizeMake(Device_Width/3, 80)
        
        _collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flaw)
        _collectionView.backgroundColor = bgColor
        _collectionView.registerClass(CYSMineMeansCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "item")
        _collectionView.delegate = self
        _collectionView.dataSource = self
        self.addSubview(_collectionView)
        _collectionView.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.top.equalTo(0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CYSUserMeansView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! CYSMineMeansCollectionViewCell
        cell.title = _titles[indexPath.row]
        cell.imageName = _imageNames[indexPath.row]
        cell.textColor = UIColor.whiteColor()
        cell.bgColor = bgColor
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        _delegate?.userMeansViewDidSelect(self, withIndex: indexPath.row)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

}

