//
//  CYSBackgroundDataOperation.swift
//  ChongYipStreet
//
//  Created by 颜魏 on 16/2/23.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

/*
    返回数据固定格式

    "msg": ""       (返回请求结果文字信息)
    "code": ""      (返回请求结果编码信息) 200：成功    400：其他错误
*/

class CYSBackgroundDataOperation: NSObject {

    //MARK: -注册
    class func requestRegister(parameters: [String: String]?, resultClosure: (data: AnyObject) -> Void) {
//        {
//            "userName":
//            "userSex":
//            "userAvator":
//        }
        //插入用户数据
        let user = BmobObject(className: "_User")
        user.setObject(parameters!["userName"], forKey: "username")
        user.setObject(parameters!["userSex"], forKey: "username")
        user.setObject(parameters!["userAvator"], forKey: "avatar")
        user.saveInBackgroundWithResultBlock { (isSuccessful: Bool, error: NSError!) -> Void in
            print("state: \(isSuccessful)")
            let dict = ["msg": "请求成功", "code": "200"]
            resultClosure(data: dict)
        }
        
    }
    
    
    
}
