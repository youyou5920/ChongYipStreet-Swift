//
//  CYSMineViewController.swift
//  ChongYipStreet
//
//  Created by David Yu on 28/1/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYSMineViewController: CYSBaseViewController {

    var _tableView: UITableView!
    var _userHeadView: CYSUserheadView!
    var _userMeansView: CYSUserMeansView!
    var _loginUser: CYSUserModel?
    var _textContents: [String]!
    var _imageContents: [String]!
    var _textContents1: [String]!
    var _imageContents1: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        _textContents = ["我的消息", "我的收藏", "我的积分", "我的朋友", "我的粉丝", "我的投资", "关注", "更多"]
        _imageContents = ["xx.png", "sc.png", "jf.png", "py.png", "fs.png", "fz.png", "gz.png", "gd.png"]
        _textContents1 = ["我的规划", "项目推广", "我的创意", "我的项目"]
        _imageContents1 = ["human1.png", "human2.png", "human3.png", "human4.png"]

        createSubViews()
    }
    
    func createSubViews() {
        let tableHeadView = UIView(frame: CGRectMake(0, 20, Device_Width, 160))
        tableHeadView.backgroundColor = UIColor.whiteColor()
        
        _userHeadView = CYSUserheadView()
        _userHeadView._delegate = self
        _userHeadView._loginUser = _loginUser
        tableHeadView.addSubview(_userHeadView)
        _userHeadView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(80)
        }

        _userMeansView = CYSUserMeansView()
        _userMeansView._delegate = self
        tableHeadView.addSubview(_userMeansView)
        _userMeansView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(_userHeadView.snp_bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(80)
        }
        
//        let line = UIView()
//        line.backgroundColor = Line_Color
//        tableHeadView.addSubview(line)
//        line.snp_makeConstraints(closure: { (make) -> Void in
//            make.left.right.equalTo(0)
//            make.height.equalTo(0.5)
//            make.centerY.equalTo(tableHeadView.snp_centerY)
//        })
//
        _tableView = UITableView(frame: CGRectZero, style: .Plain)
        _tableView.backgroundColor = Light_Background_Color
        _tableView.registerClass(CYSMineFirstTableviewCell.classForCoder(), forCellReuseIdentifier: "firstCell")
        _tableView.registerClass(CYSMineSecondTableviewCell.classForCoder(), forCellReuseIdentifier: "secondCell")
        _tableView.separatorStyle = .None
        _tableView.tableHeaderView = tableHeadView
        _tableView.tableFooterView = UIView()
        _tableView.delegate = self
        _tableView.dataSource = self
        self.view.addSubview(_tableView)
        _tableView.snp_makeConstraints { (make) -> Void in
            make.top.left.bottom.right.equalTo(0)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
}

extension CYSMineViewController: UITableViewDelegate, UITableViewDataSource {
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
            cell._titles = _textContents;
            cell._imageNames = _imageContents;
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCellWithIdentifier("secondCell") as! CYSMineSecondTableviewCell
            cell._delegate = self
            cell._titles = _textContents1;
            cell._imageNames = _imageContents1;

            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }else {
            return 160
        }
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(10*section)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Device_Width, height: 10))
        view.backgroundColor = Light_Background_Color
            
        return view
    }
}

extension CYSMineViewController: CYSUserheadViewDelegate, CYSUserMeansViewDelegate, CYSMineFirstTableviewCellDelegate, CYSMineSecondTableviewCellDelegate {
    func userheadViewDidSelectTap(view: CYSUserheadView) {
        if let _ = _loginUser {
            
        }else {
            login()
        }
    }
    
    func userMeansViewDidSelect(view: CYSUserMeansView, withIndex index: Int) {
        if let _ = _loginUser {
            
        }else {
            login()
        }
    }
    
    func mineFirstTableviewCellDidSelectItem(cell: CYSMineFirstTableviewCell, withIndex index: Int) {
        if let _ = _loginUser {
            
        }else {
            login()
        }
    }
    
    func mineSecondTableviewCellDidSelectItem(cell: CYSMineSecondTableviewCell, withIndex index: Int) {
        if let _ = _loginUser {
            
        }else {
            login()
        }
    }
}

