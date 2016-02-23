//
//  CYSFunctionViewController.swift
//  ChongYipStreet
//
//  Created by David Yu on 22/2/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

protocol CYSFunctionViewControllerDelegate {
    func functionViewControllerDidSelectBack()
}

class CYSFunctionViewController: CYSBaseViewController {

    var _delegate: CYSFunctionViewControllerDelegate?
    var _tableView: UITableView!
    var _headView: CYSProject2TableHeadView!
    var _textContents1 = [String]()
    var _imageContents1 = [String]()
    var _textContents2 = [String]()
    var _imageContents2 = [String]()
    var _textContents3 = [String]()
    var _imageContents3 = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
//        self.navigationController!.navigationBar.backgroundColor = UIColor.whiteColor()
        _textContents1 = ["我的项目", "我的计划", "我的创业", "创业记录"]
        _imageContents1 = ["my_project_1.png", "my_method.png", "my_work.png", "work_history.png"]
        _textContents2 = ["相关资料", "相关帖子", "相关项目"]
        _imageContents2 = ["relation_data.png", "relation_post.png", "relation_project.png"]
        _textContents3 = ["学习", "找团队", "寻找", "找投资"]
        _imageContents3 = ["study.png", "look_team.png", "look.png", "look_cash.png"]
        
        createSubViews()
    }
    
    func createSubViews() {
        _headView = CYSProject2TableHeadView(frame: CGRectMake(0, 0, Device_Width, 180))
        _headView._delegate = self
        
        _tableView = UITableView(frame: CGRectZero, style: .Plain)
        _tableView.backgroundColor = Line_Color
        _tableView.tableFooterView = UIView()
        _tableView.tableHeaderView = _headView
        _tableView.showsVerticalScrollIndicator = false
        _tableView.registerClass(CYSMineSecondTableviewCell.classForCoder(), forCellReuseIdentifier: "firstCell")
        _tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        _tableView.registerClass(CYSMineSecondTableviewCell.classForCoder(), forCellReuseIdentifier: "secondCell")
        _tableView.dataSource = self
        _tableView.delegate = self
        self.view.addSubview(_tableView)
        _tableView.snp_makeConstraints(closure: { (make) -> Void in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(-49)
        })
    }

}

extension CYSFunctionViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 3
        }else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("firstCell") as! CYSMineSecondTableviewCell
            cell._titles = _textContents1
            cell._imageNames = _imageContents1
            cell._delegate = self
            
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell")
            cell!.imageView!.image = UIImage(named: _imageContents2[indexPath.row])
            cell!.textLabel!.text = _textContents2[indexPath.row];
            let iv = UIImageView(frame: CGRectMake(0, 0, 40, 40))
            iv.image = UIImage(named: "right_arrows.png")
            cell!.accessoryType = .DetailButton;
            cell!.accessoryView = iv;
            
            return cell!;
        }else {
            var cell = tableView.dequeueReusableCellWithIdentifier("secondCell") as? CYSMineSecondTableviewCell
            if cell == nil {
                cell = CYSMineSecondTableviewCell(style: .Default, reuseIdentifier: "secondCell")
            }
            cell?._titles = _textContents3
            cell?._imageNames = _imageContents3
            cell!._delegate = self
            
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 60;
        }else {
            return 160;
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 10;
        }else {
            return 0.00001;
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Device_Width, height: 10))
        view.backgroundColor = Light_Background_Color
        
        return view
    }

    override func viewDidLayoutSubviews() {
        if _tableView.respondsToSelector("setSeparatorInset:") {
            _tableView.separatorInset = UIEdgeInsetsMake(0,0,0,0)
        }
        if _tableView.respondsToSelector("setLayoutMargins:") {
            _tableView.layoutMargins = UIEdgeInsetsMake(0,0,0,0)
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell.respondsToSelector("setSeparatorInset:") {
            cell.separatorInset = UIEdgeInsetsMake(0,0,0,0)
        }
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.separatorInset = UIEdgeInsetsMake(0,0,0,0)
        }
    }
}

extension CYSFunctionViewController: CYSProject2TableHeadViewDelegate {
    func project2TableHeadViewDidSelectBack() {
        _delegate?.functionViewControllerDidSelectBack()
    }
    
    func project2TableHeadView(view: CYSProject2TableHeadView, didSelectItemWithIndex index: Int) {
        print("选择了 + \(index)")
    }
}

extension CYSFunctionViewController: CYSMineSecondTableviewCellDelegate {
    func mineSecondTableviewCellDidSelectItem(cell: CYSMineSecondTableviewCell, withIndex index: Int) {
        print("选择了 + \(index)")
    }
}

extension CYSFunctionViewController: CYSMineFirstTableviewCellDelegate {
    func mineFirstTableviewCellDidSelectItem(cell: CYSMineFirstTableviewCell, withIndex index: Int) {
        print("选择了 + \(index)")
    }
}
