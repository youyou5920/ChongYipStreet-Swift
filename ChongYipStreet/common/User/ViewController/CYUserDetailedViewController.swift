//
//  CYUserDetailedViewController.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/13.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYUserDetailedViewController: CYSBaseViewController,CYUserHeadViewDelegate,CYCustomSegmentedViewDelegate  {

    let kIdentifier : String = "UserDetailedCell"
    
    let kSegmentedTitles : Array<String> = [CYNSLocalizedString("介绍"),CYNSLocalizedString("留言区")]
    
    let headView : CYUserHeadView = CYUserHeadView.initUserHeadView()
    let tableView : UITableView = UITableView()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = false
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.translucent = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initLayoutView()
        self.initNavigationBar()
    }

    func initLayoutView(){
        
        self.view.addSubview(self.headView)
        self.headView.delegate = self
        self.headView.translatesAutoresizingMaskIntoConstraints = false
        
        let segmentedView = CYCustomSegmentedView(frame: CGRectMake(0, 0, screenWidth(), 40), titles: kSegmentedTitles , delegate: self)
        self.view.addSubview(segmentedView)
        segmentedView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false

        let layoutVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[headView(120)]-0-[segmentedView(40)]-0-[tableView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["headView" : headView,"segmentedView" : segmentedView,"tableView" : tableView])
        
        let headViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[headView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["headView" : headView])
        let segmentedViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[segmentedView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["segmentedView" : segmentedView])
        let tableViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[tableView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["tableView" : tableView])

        
        self.view.addConstraints(layoutVConstraints)
        self.view.addConstraints(headViewHConstraints)
        self.view.addConstraints(segmentedViewHConstraints)
        self.view.addConstraints(tableViewHConstraints)
        
        self.tableViewReloadData()
    }
    
    func initNavigationBar(){
        
        let titleLable = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        titleLable.textAlignment = .Center
        titleLable.textColor = UIColor.whiteColor()
        titleLable.font = UIFont.systemFontOfSize(17)
        titleLable.text = CYNSLocalizedString("用户详情")
        self.navigationItem.titleView = titleLable
    }
    
    //MARK- CYUserHeadViewDelegate
    func goUserHome(userHeadView: CYUserHeadView) {
        let userHomeViewController = CYUserHomeViewController()
        self.navigationController?.pushViewController(userHomeViewController, animated: true)
    }
    //MARK:- CYCustomSegmentedViewDelegate
    func customSegmentedView(segmentedView: CYCustomSegmentedView, selectIndex: Int) {

    }

}

//MARK:- TableViewDelegate
extension CYUserDetailedViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableViewReloadData(){

        self.tableView.separatorStyle = .SingleLine
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  3
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return CYNSLocalizedString("用户项目")
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(kIdentifier)
        
        if cell == nil{
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: kIdentifier)
        }
        switch indexPath.item{
        case 0:cell?.textLabel?.text = CYNSLocalizedString("个人介绍:")
        case 1:cell?.textLabel?.text = CYNSLocalizedString("擅长方面:")
        case 2:cell?.textLabel?.text = CYNSLocalizedString("用户需求:")
        default:break;
        }
        
        cell?.detailTextLabel?.numberOfLines = 0
        cell?.detailTextLabel?.text = "撒打算打算打算打算打算的撒打算打算打算打算打算的撒打算打算打算打算打算的撒打算打算打算打算打算的撒打算打算打算打算打算的"
        
        
        return cell ?? UITableViewCell()
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.tableViewReloadData()
    }
    

}