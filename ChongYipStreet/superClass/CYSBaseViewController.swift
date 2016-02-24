//
//  CYSBaseViewController.swift
//  ChongYipStreet
//
//  Created by David Yu on 28/1/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

class CYSBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let parameters = ["userName": "yw3", "userSex": false, "userAvator": "", "userId": "91897ddff2"]
        CYSHttpManager.shareInstance.requestChangeUserInfos(parameters, successClosure: { (data) -> Void in
            
            }, otherFailureClosure: { (data) -> Void in
                
            }) { (data) -> Void in
                
        }
    }
    
    //跳转到登陆页面
    func login() {
        let loginVC = CYSLoginViewController()
        loginVC.hidesBottomBarWhenPushed = true
        self.navigationController?.showViewController(loginVC, sender: nil)
    }
    
    //摇一摇
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        super.motionEnded(motion, withEvent: event)
        
    }
    
}
