//
//  CYPostViewController.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/7.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYPostViewController: UIViewController {

    let wedView = UIWebView()
    
    let toorBar = UIToolbar()
    var toorBarBottomConstraint : NSLayoutConstraint? = nil
    let textField = UITextField(frame: CGRectMake(0,0,screenWidth() / 2,30))
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.addNotification()
        self.navigationController?.navigationBar.translucent = false
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
        self.navigationController?.navigationBar.translucent = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initLayoutVIew()
        self.initNavigationBar()
    }
    func initLayoutVIew(){
        
        let leftImegView = UIImageView(frame: CGRectMake(0, 0, 30, 30))
        self.textField.leftViewMode = .Always
        self.textField.leftView = leftImegView
        self.textField.background = UIImage(named: "textFieldBackground1")
        self.textField.placeholder = CYNSLocalizedString("写评论")
        
        let spanItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let textFieldItem = UIBarButtonItem(customView: self.textField)
        
        let messageItem = UIBarButtonItem(image: UIImage(named: "message"), style: .Plain, target: self, action: "messageAction:")
        let dianzanItem = UIBarButtonItem(image: UIImage(named: "dianzan"), style: .Plain, target: self, action: "dianzanAction:")
        let shoucanItem = UIBarButtonItem(image: UIImage(named: "shoucan"), style: .Plain, target: self, action: "shoucanAction:")
        let fenxianItem = UIBarButtonItem(image: UIImage(named: "fenxian"), style: .Plain, target: self, action: "fenxianAction:")
        self.toorBar.items = [textFieldItem,spanItem,messageItem,spanItem,dianzanItem,spanItem,shoucanItem,spanItem,fenxianItem]
        
        
        self.view.addSubview(self.wedView)
        self.view.addSubview(self.toorBar)
        
        self.toorBar.translatesAutoresizingMaskIntoConstraints = false
        self.wedView.translatesAutoresizingMaskIntoConstraints = false
        
        let wedViewHConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[wedView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["wedView":wedView])
        let wedViewVConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[wedView]-44-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["wedView":wedView])
        
        let toorBarHConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[toorBar]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["toorBar":toorBar])
        let toorBarHeightConstraint = NSLayoutConstraint(item: self.toorBar, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 44)
        toorBarBottomConstraint = NSLayoutConstraint(item: self.toorBar, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        
        self.view.addConstraints(wedViewHConstraint)
        self.view.addConstraints(wedViewVConstraint)
        
        self.view.addConstraints(toorBarHConstraint)
        if let layoutConstraint = self.toorBarBottomConstraint{
            self.view.addConstraints([toorBarHeightConstraint,layoutConstraint])
        }
        
    }
    func initNavigationBar(){
        
        let addButton = UIButton(type: .System)
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 12
        addButton.frame = CGRectMake(0,0,56,25)
        addButton.backgroundColor = UIColor.whiteColor()
        addButton.setTitle("添加", forState: .Normal)
        addButton.setTitleColor(appMainColor, forState: .Normal)
        addButton.addTarget(self, action: "addAction:", forControlEvents: .TouchUpInside)
 
        let addItem = UIBarButtonItem(customView: addButton)
        
        let searchItem = UIBarButtonItem(image: UIImage(named: "search"), style: .Plain, target: self, action: "searchAction:")
        self.navigationItem.rightBarButtonItems = [addItem, searchItem]
    }
    
    func addAction(fenxianItem : UIBarButtonItem){
    }
    func searchAction(searchItem : UIBarButtonItem){
    }
    
    
    func messageAction(messageItem : UIBarButtonItem){
    }
    func dianzanAction(dianzanItem : UIBarButtonItem){
    }
    func shoucanAction(shoucanItem : UIBarButtonItem){
    }
    func fenxianAction(fenxianItem : UIBarButtonItem){
    }
    
    
    //MARK:- NotificationEvent
    func addNotification(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleKeyboardDidShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleKeyboardDidHidden:", name: UIKeyboardWillHideNotification, object: nil)
    }
    func handleKeyboardDidShow(notification : NSNotification){
        
        if let userInfo = notification.userInfo, let keyBoardValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
            let keyBoardFrame = keyBoardValue.CGRectValue()
            self.toorBarBottomConstraint?.constant = -(keyBoardFrame.size.height)
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.toorBar.layoutIfNeeded()
            })
        }
    }
    func handleKeyboardDidHidden(notification : NSNotification){
        self.toorBarBottomConstraint?.constant = 0
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.toorBar.layoutIfNeeded()
        })
    }

}
