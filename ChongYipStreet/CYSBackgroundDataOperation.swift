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

    //MARK: - 登录
    class func requestLogin(var parameters: [String: AnyObject], resultClosure: (data: AnyObject) -> Void) {
        //插入用户数据
        let user = BmobObject(className: "_User")
        user.setObject(parameters["userName"], forKey: "username")
        user.setObject(parameters["userSex"] as! Bool, forKey: "sex")
        user.setObject("123456", forKey: "password")
        user.saveInBackgroundWithResultBlock { (isSuccessful: Bool, error: NSError!) -> Void in
            print("state: \(isSuccessful)")
            let dict = ["msg": "请求成功", "code": "200"]
            resultClosure(data: dict)
        }
        
    }
    
    //MARK: - 获取用户信息
    class func requestUserInfos(parameters: [String: AnyObject], resultClosure: (data: AnyObject) -> Void) {
        //获取用户数据
        let bquery = BmobQuery(className: "_User")
        let userId = parameters["userId"] as! String
        bquery.getObjectInBackgroundWithId(userId) { (object: BmobObject!, error: NSError!) -> Void in
            if error == nil {
                print("state: + ", object.objectForKey("username"))
                let dict = ["msg": "请求成功", "code": "200"]
                resultClosure(data: dict)
            }
        }
    }
    
    //MARK: - 修改用户信息
    class func requestChangeUserInfos(parameters: [String: AnyObject], resultClosure: (data: AnyObject) -> Void) {
        //获取用户数据
        let bquery = BmobQuery(className: "_User")
        let userId = parameters["userId"] as! String
        bquery.getObjectInBackgroundWithId(userId) { (object: BmobObject!, error: NSError!) -> Void in
            if error == nil {
                print("state: + ", object.objectForKey("username"))
                let dict = ["msg": "请求成功", "code": "200"]
                resultClosure(data: dict)
                if object != nil {
                    //根据上传数据获取上传文件对象
                    let file = BmobFile(fileName: "avator_ceshi.png", withFileData: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("gd@2x", ofType: "png")!))
                    //开启异步上传文件数据
                    file.saveInBackground({ (state: Bool, error: NSError!) -> Void in
                        print("state: \(state)")
                        print("path: \(file.url)")
                        let obj = BmobObject(withoutDatatWithClassName: object.className, objectId: object.objectId)
                        obj.setObject(file.url, forKey: "avator")
                        //异步更新数据
                        obj.updateInBackgroundWithResultBlock({ (state: Bool, error: NSError!) -> Void in
                            print("avator state: \(state)")
                        })
                    })
                    
                }
            }
        }
    }

    
}
