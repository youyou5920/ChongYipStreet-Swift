
//
//  CYSEditUserInfosViewController.swift
//  ChongYipStreet
//
//  Created by 颜魏 on 16/2/12.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYSEditUserInfosViewController: CYSBaseViewController {

    var _loginUser: CYSUserModel?
    var _tableView: UITableView!
    var _titles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _titles = ["名字", "所在地", "毕业院校", "出生日期", "个人介绍", "擅长方面", "用户需求"]
        createSubViews()
    }

    func createSubViews() {
        _tableView = UITableView(frame: CGRectZero, style: .Plain)
        _tableView.backgroundColor = Light_Background_Color
        _tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        _tableView.separatorStyle = .None
        _tableView.tableHeaderView = UIView()
        _tableView.tableFooterView = UIView()
        _tableView.delegate = self
        _tableView.dataSource = self
        self.view.addSubview(_tableView)
        _tableView.snp_makeConstraints { (make) -> Void in
            make.top.left.bottom.right.equalTo(0)
        }
    }
    
}

extension CYSEditUserInfosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        return cell!
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRectMake(0, 0, Device_Width, 30))
        label.font = UIFont.systemFontOfSize(14)
        label.text = "    基本资料"
        
        return label
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
