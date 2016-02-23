//
//  CYCommunicateViewController.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/6.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYCommunicateViewController: CYSBaseViewController,CYCustomSegmentedViewDelegate,CYCustomButtonsDelegate {
    
    let kIdentifier : String = "CommunicateCell"
    
    let kSegmentedTitles : Array<String> = [CYNSLocalizedString("联系人"),CYNSLocalizedString("群组")]
    let kSubTitles : Array<String> = [CYNSLocalizedString("消息"),CYNSLocalizedString("联系"),CYNSLocalizedString("动态")]
    let kSubImages : Array<String> = ["cang","cang","cang"]
    
    var tableView = UITableView()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = false
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.translucent = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayoutView()
        self.initNavigationBar()
        self.initLoadingData()
    }
    
    func initLoadingData(){

    }
    func initLayoutView(){
        
        let segmentedView = CYCustomSegmentedView(frame: CGRectMake(0, 0, screenWidth(), 40), titles: kSegmentedTitles , delegate: self)
        let customButtons = CYCustomButtons(buttonSize:CGSize(width: 40,height: 40) , titles: kSubTitles, images: kSubImages,delegate: self)
        
        self.view.addSubview(segmentedView)
        self.view.addSubview(self.tableView)
        self.view.addSubview(customButtons)
        
        segmentedView.translatesAutoresizingMaskIntoConstraints = false
        customButtons.translatesAutoresizingMaskIntoConstraints = false
   
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.registerNib(UINib(nibName: "CYCommandCell", bundle: nil), forCellReuseIdentifier: kIdentifier)
        
        
        let segmentedViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[segmentedView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["segmentedView" : segmentedView])
        let customButtonsHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[customButtons]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["customButtons" : customButtons])
        let tableViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[tableView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["tableView" : tableView])
        let layoutVConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[segmentedView(40)]-0-[tableView]-0-[customButtons(64)]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["segmentedView" : segmentedView,"tableView" : tableView, "customButtons" : customButtons])
        
        self.view.addConstraints(segmentedViewHConstraints)
        self.view.addConstraints(customButtonsHConstraints)
        self.view.addConstraints(tableViewHConstraints)
        self.view.addConstraints(layoutVConstraints)
        
        self.tableViewReloadData()
    }
    func initNavigationBar(){

        let titleLable = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        titleLable.textAlignment = .Center
        titleLable.textColor = UIColor.whiteColor()
        titleLable.font = UIFont.systemFontOfSize(17)
        titleLable.text = CYNSLocalizedString("交流圈")
        
        self.navigationItem.titleView = titleLable
        self.navigationItem.rightBarButtonItems =
            [UIBarButtonItem(title: CYNSLocalizedString("添加"), style: .Plain, target: self, action: "actionAdd:"),
             UIBarButtonItem(image: UIImage(named: "search"), style: .Plain, target: self, action: "actionSearch:") ]
    }
    

    //MARK:- FooterToorbarEvent
    
    
    //MARK:- NavigationEvent
    func actionMessage(messageItem : UIBarButtonItem){
        
    }
    func actionAdd(addItem : UIBarButtonItem){
        
    }
    func actionSearch(searchItem : UIBarButtonItem){
        
    }
    //MARK:- CYCustomSegmentedViewDelegate、CYCustomButtons
    func customSegmentedView(segmentedView: CYCustomSegmentedView, selectIndex: Int) {
        

    }
    
    func customButtons(customButton: CYCustomButtons, selectIndex: Int) {
        
    }
    
}

//MARK:- TableViewDelegate
extension CYCommunicateViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableViewReloadData(){
        if false{
            self.tableView.separatorStyle = .None
        }
        else{
            self.tableView.separatorStyle = .SingleLine
        }
        

        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kIdentifier, forIndexPath: indexPath)
        
        if let commandCell = cell as? CYCommandCell{
            commandCell.contentImageView.image = UIImage(named: "201510296120828674")
            commandCell.typeLabel.text = "商业"
            commandCell.contentLabel.numberOfLines = 0
            commandCell.contentLabel.text = "撒打算几点回家卡圣诞节喀什的空间啊是贷款计划"
            
            commandCell.likeButton.setTitle("110", forState: .Normal)
            commandCell.shoucanButton.setTitle("8888", forState: .Normal)
        }
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
