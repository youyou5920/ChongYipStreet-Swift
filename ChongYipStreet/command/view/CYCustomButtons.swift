//
//  CYButtons.swift
//  ChongYipStreet
//
//  Created by youyou5920 on 16/2/5.
//  Copyright © 2016年 yanwei. All rights reserved.
//



import UIKit
protocol CYButtonDelegate : NSObjectProtocol{
    func buttonDidSelectIndex(button : CYButton, selectIndex : Int)
}

enum CYButtonLayoutState : Int{
    case Normal     = 0
    case Special    = 1
}
class CYButton: UIView {//使用该类注意图片尺寸正确
    
    let toolbar = UIToolbar()
    var buttons = [UIButton]()
    
    var layoutState : CYButtonLayoutState = .Normal
    
    var delegate : CYButtonDelegate? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    init() {
        super.init(frame: CGRectZero)
        
        self.addSubview(toolbar)
        
        toolbar.tintColor = UIColor.blackColor()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
        let toolbarHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[toolbar]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["toolbar" : toolbar])
        let toolbarVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[toolbar]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["toolbar" : toolbar])
        self.addConstraints(toolbarHConstraints)
        self.addConstraints(toolbarVConstraints)
    }

    func loadToolItems_noraml(){
        
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        var toolItems = [spaceItem]
        
        for button in buttons{
            toolItems += [UIBarButtonItem(customView: button),spaceItem]
        }
        
        toolbar.items = toolItems
    }
    
    func loadToolItems_special(){
        
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        var toolItems = [UIBarButtonItem]()
        
        for button in buttons{
            toolItems += [UIBarButtonItem(customView: button),spaceItem]
        }
        toolItems.removeLast()
        toolbar.items = toolItems
    }
    
    func setButtonInfo(buttonSize : CGSize,titles : Array<String>, images : Array<String>, delegate : CYButtonDelegate?){
        
        self.delegate = delegate
        
        for button in buttons{
            button.removeFromSuperview()
        }
        buttons.removeAll()
        
        for index in 0 ..< titles.count{
            
            let button = UIButton(type: .System)
            
            button.tag = index + 1024
            button.contentVerticalAlignment = .Top
            button.contentHorizontalAlignment = .Left
            button.frame = CGRect(x: 0, y: 0, width: buttonSize.width, height: buttonSize.height)
            button.addTarget(self, action: "actionTouchUpInside:", forControlEvents: .TouchUpInside)
            
            button.setTitle(titles[index], forState: .Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            
            if let image = UIImage(named: images[index]){
                let titleLeftSpan = (buttonSize.width - titles[index].boundingRectWithSize(buttonSize, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFontOfSize(14)], context: nil).size.width) / 2.0
                button.setImage(image.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
                button.imageEdgeInsets = UIEdgeInsetsMake(0, 11, 22, 11)
                button.titleEdgeInsets = UIEdgeInsetsMake(buttonSize.height - 20, -image.size.width + titleLeftSpan, 0, 0)
            }
            buttons.append(button)
        }
        
        switch layoutState{
        case .Normal:
            self.loadToolItems_noraml()
        case .Special:
            self.loadToolItems_special()
        }
    }
    
    func actionTouchUpInside(button : UIButton){
        self.delegate?.buttonDidSelectIndex(self, selectIndex: button.tag - 1024)
    }
}
