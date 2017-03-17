//
//  SwiftDemoBaseItem.swift
//  SwiftDemo
//
//  Created by tuan800 on 2017/3/17.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class SwiftDemoBaseItem: LittleHTableViewBaseItem {
    public var title : String?
    public var height : CGFloat = 0
    public var index : NSNumber?
    public var subItems  =  NSMutableArray()
    
    public class func defaultItem() -> SwiftDemoBaseItem{
        let item = SwiftDemoBaseItem()
        item.height = 40

        return item
    }
    
    public class func item(_ dict : NSDictionary?) ->SwiftDemoBaseItem{
        let aItem = SwiftDemoBaseItem()
        aItem.height = 40
        
        if let title = dict?.object(forKey: "title") as? String{
            aItem.title = title
        }
        
        if let index = dict?.object(forKey: "index") as? NSNumber{
            aItem.index = index
        }
        
        if let subItems = dict?.object(forKey: "subTitle") as? NSArray{
            for d in subItems{
                let dict = d as! NSDictionary
                let atomItem = SwiftDemoBaseItem.item(dict);
                aItem.subItems.add(atomItem)
            }
        }
        
        return aItem
    }
}
