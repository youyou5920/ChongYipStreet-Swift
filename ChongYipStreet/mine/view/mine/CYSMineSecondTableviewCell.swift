//
//  CYSMineSecondCollectionViewCell.swift
//  ChongYipStreet
//
//  Created by 颜魏 on 16/2/11.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

protocol CYSMineSecondTableviewCellDelegate {
    func mineSecondTableviewCellDidSelectItem(cell: CYSMineSecondTableviewCell, withIndex index: Int)
}

class CYSMineSecondTableviewCell: UITableViewCell {
    
    var _delegate: CYSMineSecondTableviewCellDelegate?
    var _collectionView: UICollectionView!
    var _titles: [String] = []
    var _imageNames: [String] = []

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.whiteColor()
                
        let flaw = UICollectionViewFlowLayout()
        flaw.itemSize = CGSizeMake(Device_Width/2-0.5, 80)
        
        _collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flaw)
        _collectionView.backgroundColor = Line_Color
        _collectionView.registerClass(CYSMineSecondCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "item")
        _collectionView.delegate = self
        _collectionView.dataSource = self
        _collectionView.scrollEnabled = false
        self.contentView.addSubview(_collectionView)
        _collectionView.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.top.equalTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CYSMineSecondTableviewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _titles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! CYSMineSecondCollectionViewCell
        cell.title = _titles[indexPath.row]
        cell.imageName = _imageNames[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        _delegate?.mineSecondTableviewCellDidSelectItem(self, withIndex: indexPath.row)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.5
    }
    
}

