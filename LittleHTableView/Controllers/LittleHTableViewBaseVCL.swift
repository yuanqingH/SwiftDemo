//
//  LittleHTableViewBaseVCL.swift
//  LittleHTableViewDemo
//
//  Created by tuan800 on 2017/3/10.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class LittleHTableViewBaseVCL: LittleHBaseVCL,UITableViewDelegate {
    public var tableView : UITableView? = UITableView.init(frame: CGRect.zero)
    private var _dataSource : LittleHTableViewDataSource?
    public var dataSource : LittleHTableViewDataSource?{
        get{
            return _dataSource
        }
        
        set{
            if newValue != _dataSource {
                _dataSource = newValue
            }
            
            if let tableView1 = self.tableView {
                tableView1.dataSource = _dataSource
                tableView1.reloadData()
            }
        }
    }
    
    deinit {
        if let tableView1 = self.tableView{
            tableView1.dataSource = nil
            tableView1.delegate = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.frame = self.tableViewFrame()
        self.view.addSubview(self.tableView!)
        self.tableView?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableViewFrame() -> CGRect{
        let rect = CGRect.init(origin: CGPoint.zero, size: self.view.bounds.size)
        return rect;
    }
    
    
    //MARK:UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (tableView.dataSource is LittleHTableViewDataSource) {
            let dataSource:LittleHTableViewDataSource? = tableView.dataSource as? LittleHTableViewDataSource
            if let d1 = dataSource {
                let object = d1.tableView(tableView, objectForRowAt: indexPath)
                if let obj1 = object {
                    let t1:LittleHTableViewBaseCell.Type =  d1.tableView(tableView, cellClassForObject: obj1)
                    return t1.tableView(tableView, rowHeightForObject: obj1)
                }
            }
        }
        return 30.0
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tableView.dataSource is LittleHTableViewDataSource) {
            let dataSource:LittleHTableViewDataSource? = tableView.dataSource as? LittleHTableViewDataSource
            if let d1 = dataSource {
                let object = d1.tableView(tableView, objectForRowAt: indexPath)
                if let obj1 = object {
                    let t1:LittleHTableViewBaseCell.Type =  d1.tableView(tableView, cellClassForObject: obj1)
                    return t1.tableView(tableView, rowHeightForObject: obj1)
                }
            }
        }
        return 44.0
    }

}
