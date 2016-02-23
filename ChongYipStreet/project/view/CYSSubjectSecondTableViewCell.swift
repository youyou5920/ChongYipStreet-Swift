//
//  CYSSubjectSecondTableViewCell.swift
//  ChongYipStreet
//
//  Created by David Yu on 22/2/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

protocol CYSSubjectSecondTableViewCellDelegate {
    func subjectSecondTableViewCell(cell: CYSSubjectSecondTableViewCell, didSlelectItemIndex index: Int)
}

class CYSSubjectSecondTableViewCell: UITableViewCell {

    var _delegate: CYSSubjectSecondTableViewCellDelegate?
    var _collectionView: UICollectionView!
    let _titles = [String]()
    let _images = [String]()
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, titles: [String], images: [String]) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()

        let flawLayout = UICollectionViewFlowLayout()
        flawLayout.minimumLineSpacing = 0
        flawLayout.minimumLineSpacing = 0
        flawLayout.itemSize = CGSizeMake(Device_Width/2, 100)
        
        _collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flawLayout)
        _collectionView.backgroundColor = UIColor.whiteColor()
        _collectionView.scrollEnabled = false
        _collectionView.showsHorizontalScrollIndicator = false
        _collectionView.registerClass(CYSSubjectSecondCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "item")
        _collectionView.dataSource = self
        _collectionView.delegate = self
        self.contentView.addSubview(_collectionView)
        _collectionView.snp_makeConstraints(closure: { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)
        })
        
        let view = UIView()
        view.backgroundColor = Line_Color
        self.contentView.addSubview(view)
        view.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(self.snp_centerY)
            make.right.equalTo(0)
            make.height.equalTo(0.5)
            make.left.equalTo(0)
        })
        
        let view1 = UIView()
        view1.backgroundColor = Line_Color
        self.contentView.addSubview(view1)
        view1.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(Device_Width/2)
            make.top.equalTo(0)
            make.width.equalTo(0.5)
            make.bottom.equalTo(0)
        })
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CYSSubjectSecondTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! CYSSubjectSecondCollectionViewCell
        cell.title = _titles[indexPath.item]
        cell.imageName = _images[indexPath.item]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
         _delegate?.subjectSecondTableViewCell(self, didSlelectItemIndex: indexPath.row)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}
