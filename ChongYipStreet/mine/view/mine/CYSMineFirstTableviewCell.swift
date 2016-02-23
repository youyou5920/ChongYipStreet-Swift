//
//  CYSMineFirstCollectionViewCell.swift
//  ChongYipStreet
//
//  Created by 颜魏 on 16/2/11.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

protocol CYSMineFirstTableviewCellDelegate {
    func mineFirstTableviewCellDidSelectItem(cell: CYSMineFirstTableviewCell, withIndex index: Int)
}

class CYSMineFirstTableviewCell: UITableViewCell {
    
    var _delegate: CYSMineFirstTableviewCellDelegate?
    var _collectionView: UICollectionView!
    var _titles: [String]? {
        didSet {
            if _titles?.count == _imageNames?.count {
                _collectionView.reloadData()
            }
        }
    }
    var _imageNames: [String]? {
        didSet {
            if _titles?.count == _imageNames?.count {
                _collectionView.reloadData()
            }
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.whiteColor()
        
        let flaw = UICollectionViewFlowLayout()
        flaw.itemSize = CGSizeMake(Device_Width/4-0.5, Device_Width/4-0.25)
        
        _collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flaw)
        _collectionView.backgroundColor = Line_Color
        _collectionView.registerClass(CYSMineMeansCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "item")
        _collectionView.delegate = self
        _collectionView.dataSource = self
        self.contentView.addSubview(_collectionView)
        _collectionView.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.top.equalTo(0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CYSMineFirstTableviewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if _titles != nil {
            return _titles!.count
        }else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! CYSMineMeansCollectionViewCell
        cell.title = _titles![indexPath.row]
        cell.imageName = _imageNames![indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        _delegate?.mineFirstTableviewCellDidSelectItem(self, withIndex: indexPath.row)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.5
    }
    
}

