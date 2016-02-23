//
//  CYSProjectViewController.swift
//  ChongYipStreet
//
//  Created by David Yu on 28/1/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYSProjectViewController: CYSBaseViewController {

    var _cateView: CYSHumanCateView!
    var _tableView: UITableView!
    var _textContents: [String]!
    var _imageContents: [String]!
    var _textContents1: [String]!
    var _imageContents1: [String]!
    var _funVC :CYSFunctionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.barTintColor = UIColor.redColor()
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        self.title = "项目"
        _textContents = ["网店", "微店", "互联网", "生活", "服装", "游戏", "餐饮", "更多"]
        _imageContents = ["tao.png", "wei.png", "hu.png", "sheng.png", "nv.png", "you.png", "cang.png", "geng.png"]
        _textContents1 = ["寻找\n合伙人", "寻找\n投资人", "最近\n项目", "寻找\n项目"]
        _imageContents1 = ["shr.png", "tzr.png", "hhr.png", "xm.png"]
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "my_project.png"), style:.Done, target: self, action: "actionLeft:")
        
        initSubViews()
        _funVC = CYSFunctionViewController()
        _funVC._delegate = self
        _funVC.view.frame = self.view.bounds
        self.view.insertSubview(_funVC.view, atIndex:0)
    }
    
    func initSubViews() {
        _cateView = CYSHumanCateView(frame: CGRectMake(0, 64, Device_Width, 120))
        _cateView._delegate = self
        
        _tableView = UITableView(frame: CGRectZero, style: .Plain)
        _tableView.registerClass(CYSMineFirstTableviewCell.classForCoder(), forCellReuseIdentifier: "firstCell")
        _tableView.registerClass(CYSMineSecondTableviewCell.classForCoder(), forCellReuseIdentifier: "secondCell")
        _tableView.backgroundColor = Line_Color
        _tableView.tableFooterView = UIView()
        _tableView.tableHeaderView = _cateView
        _tableView.showsVerticalScrollIndicator = false
        _tableView.separatorStyle = .None
        _tableView.dataSource = self
        _tableView.delegate = self
        self.view.addSubview(_tableView)
        _tableView.snp_makeConstraints(closure: { (make) -> Void in
            make.left.right.equalTo(0)
            make.top.equalTo(64)
            make.bottom.equalTo(-49)
        })
    }

    func actionLeft(item: UIBarButtonItem) {
        view.bringSubviewToFront(_funVC.view)
        self.navigationController?.navigationBarHidden = true
    }
}

extension CYSProjectViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("firstCell") as! CYSMineFirstTableviewCell
            cell._delegate = self
            cell.selectionStyle = .None;
            cell._titles = _textContents
            cell._imageNames = _imageContents
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCellWithIdentifier("secondCell") as! CYSMineSecondTableviewCell
            cell._delegate = self
            cell.selectionStyle = .None;
            cell._titles = _textContents1
            cell._imageNames = _imageContents1

            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 200
        }else {
            return Device_Width/2
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 10
        }else {
            return 0.00001
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let view = UIView(frame: CGRectMake(0, 0, Device_Width, 10))
            view.backgroundColor = Line_Color
            
            return view
        }else {
            return nil
        }
    }
    
}

extension CYSProjectViewController: CYSFunctionViewControllerDelegate {
    func functionViewControllerDidSelectBack() {
        self.view.insertSubview(_funVC.view, atIndex:0)
        self.navigationController!.navigationBarHidden = false
        _tableView.snp_remakeConstraints { (make) -> Void in
            make.left.right.equalTo(0)
            make.top.equalTo(44)
            make.bottom.equalTo(-49)
        }
    }
}

extension CYSProjectViewController: CYSSubjectSecondTableViewCellDelegate {
    func subjectSecondTableViewCell(cell: CYSSubjectSecondTableViewCell, didSlelectItemIndex index: Int) {
        print("选择了+\(index)")
    }
}

extension CYSProjectViewController: CYSHumanCateViewDelegate {
    func humanCateView(view: CYSHumanCateView, didSlelectItemIndex index: Int) {
        print("选择了+\(index)")
    }
}

extension CYSProjectViewController: CYSMineSecondTableviewCellDelegate {
    func mineSecondTableviewCellDidSelectItem(cell: CYSMineSecondTableviewCell, withIndex index: Int) {
        print("选择了 + \(index)")
    }
}

extension CYSProjectViewController: CYSMineFirstTableviewCellDelegate {
    func mineFirstTableviewCellDidSelectItem(cell: CYSMineFirstTableviewCell, withIndex index: Int) {
        print("选择了 + \(index)")
    }
}
