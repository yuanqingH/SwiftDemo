//
//  SwiftDemoHomeModel.swift
//  SwiftDemo
//
//  Created by tuan800 on 2017/3/17.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class SwiftDemoHomeModel: SwiftDemoBaseModel {
    public override func loadItem(_ completion : @escaping (NSDictionary?)->Void) -> Void{
        DispatchQueue.global().async {
            self.readPlist()
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
    
    func readPlist() -> Void{
        let path = Bundle.main.path(forResource: "DemoList", ofType: "plist")
        
        let demos = NSArray(contentsOfFile:path!)
        
        for d in demos!{
            let dict = d as! NSDictionary
            let item = SwiftDemoBaseItem.item(dict)
            self.items?.add(item)
        }
    }
}
