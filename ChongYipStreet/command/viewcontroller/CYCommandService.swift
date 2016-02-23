//
//  CYCommandService.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/6.
//  Copyright © 2016年 yanwei. All rights reserved.
//

import UIKit

let kNotificationGetCommandDataFailed = "NotificationGetCommandDataFailed"
let kNotificationGetCommandDataSucceed = "NotificationGetCommandDataSucceed"

enum CommandType : Int{
    case All            = 0
    case Experience     = 1
    case interrelated   = 2
    case Program        = 3
}
class CYCommandService: NSObject {
    
    var commandType : CommandType = .All
    private var commandDatas : [String:AnyObject] = Dictionary()
    

    func setCommandDatas(commandData : Array<AnyObject>){
        self.commandDatas["\(commandType.rawValue)"] = commandData
    }
    func getCommandDatasCount() -> Int{
        return self.getCommandDatas().count
    }
    func getCommandDatas() -> Array<AnyObject>{
        return self.commandDatas["\(commandType.rawValue)"] as? Array<AnyObject> ?? Array()
    }
    
    func loadGetCommandData(commandType : CommandType){
        self.commandType = commandType
        
        
        NSNotificationCenter.defaultCenter().postNotificationName(kNotificationGetCommandDataSucceed, object: nil)
    }
    
    
}
