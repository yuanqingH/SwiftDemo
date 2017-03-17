//
//  LittleHTableViewDataSource.swift
//  LittleHTableViewDemo
//
//  Created by tuan800 on 2017/3/14.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit
public protocol LittleHTableViewDataSourcePotocol:NSObjectProtocol,UITableViewDataSource{
    func tableView(_ tableView:UITableView, objectForRowAt indexPath:IndexPath) -> AnyObject?
    
    func tableView(_ tableView: UITableView, cellClassForObject object: AnyObject) -> LittleHTableViewBaseCell.Type
    
    func tableView(_ tableView: UITableView, indexPathForObject object: AnyObject) -> IndexPath?
    
    func tableView(_ tableView: UITableView, cell:UITableViewCell, willAppearAtIndexPath indexPath: IndexPath) -> Void
}

public class LittleHTableViewDataSource: NSObject,LittleHTableViewDataSourcePotocol {
    public var items : NSArray
    
    public init(items : NSArray) {
        self.items = items
    }
    
    // MARK:
    // MARK: -LittleHTableViewDataSourcePotocol 方法
    public func tableView(_ tableView: UITableView, objectForRowAt indexPath: IndexPath) -> AnyObject? {
        if indexPath.row < self.items.count {
            return self.items.object(at: indexPath.row) as AnyObject?
        } else {
            return nil
        }
    }
    
    public func tableView(_ tableView: UITableView, cellClassForObject object: AnyObject) -> LittleHTableViewBaseCell.Type {
        return LittleHTableViewBaseCell.self
    }
    
    public func tableView(_ tableView: UITableView, indexPathForObject object: AnyObject) -> IndexPath? {
        return nil
    }
    
    public func tableView(_ tableView: UITableView, cell:UITableViewCell, willAppearAtIndexPath indexPath: IndexPath) -> Void {
        
    }
    
    // MARK:
    // MARK: -UITableViewDataSource方法
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object:AnyObject? = self.tableView(tableView, objectForRowAt: indexPath)
        
        var cell1:UITableViewCell
        
        if let obj1 = object {
            let cellClass:LittleHTableViewBaseCell.Type = self.tableView(tableView, cellClassForObject: obj1)
            let identifier:String = cellClass.LittleHIdentifier()
            var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
            if cell == nil {
                cell = cellClass.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            }
            cell1 = cell!
        } else {
            cell1 = LittleHTableViewBaseCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        }
        
        if cell1 is LittleHTableViewBaseCell {
            let cell2 = cell1 as! LittleHTableViewBaseCell
            cell2.setObject(object)
        }
        
        return cell1
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    open func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if let view1 = tableView.tableHeaderView {
            if index == 0 {
                tableView.scrollRectToVisible(view1.bounds, animated: false)
                return -1
            }
        }
        
        //        let index2 = advance(title.startIndex, 1)
        var index2:String.Index = title.startIndex
        index2 = title.index(index2, offsetBy: 1)
        
        let letter:String = title.substring(to: index2)
        let sectionCount:Int = tableView.numberOfSections
        
        var i:Int = 0
        for _ in 1...sectionCount {
            let section :String = (tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: i))!
            if section.hasPrefix(letter) {
                return i
            }
            i += 1
        }
        
        if index > sectionCount {
            return sectionCount - 1
        } else {
            return index
        }
    }
}
