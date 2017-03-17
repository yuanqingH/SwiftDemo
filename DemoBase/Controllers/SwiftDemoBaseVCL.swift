//
//  SwiftDemoBaseVCL.swift
//  SwiftDemo
//
//  Created by tuan800 on 2017/3/17.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class SwiftDemoBaseVCL: LittleHTableViewBaseVCL {

    public var demoItem : SwiftDemoBaseItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    func loadItem(_ modelType : SwiftDemoBaseModel.Type) -> Void{
        self.model = modelType.init()
        let model = self.model as! SwiftDemoBaseModel
        model.loadItem { [weak self](dict) in
            self?.reloadData()
        }
    }
    
    func reloadData() -> Void {
        let model = self.model as! SwiftDemoBaseModel
        if model.items?.count == 0 {
            if let dItem = self.demoItem {
                model.items = dItem.subItems
            }
        }
        let dataSource = SwiftDemoBaseDataSource(items:model.items!)
        self.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func setParameters(_ params: NSDictionary?) {
        super.setParameters(params)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView?.deselectRow(at: indexPath, animated: false)//这个方法为了解决 弹出alert之后alert消失 cell短时间内点击无响应的问题
        let cell = tableView.cellForRow(at: indexPath) as! SwiftDemoBaseCell
        let aItem = cell.item as! SwiftDemoBaseItem
        self.openDemoPage(aItem)
    }
    
    func openDemoPage(_ item:SwiftDemoBaseItem?) -> Void {
    
    }

}
