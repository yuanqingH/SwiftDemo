//
//  SwiftDemoBaseDataSource.swift
//  SwiftDemo
//
//  Created by tuan800 on 2017/3/17.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class SwiftDemoBaseDataSource: LittleHTableViewDataSource {
    override func tableView(_ tableView: UITableView, cellClassForObject object: AnyObject) -> LittleHTableViewBaseCell.Type {
        if object is SwiftDemoBaseItem{
            return SwiftDemoBaseCell.self
        }
        
        return super.tableView(tableView, cellClassForObject: object)
    }
}
