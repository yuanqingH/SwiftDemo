//
//  SwiftDemoHomeVCL.swift
//  SwiftDemo
//
//  Created by tuan800 on 2017/3/17.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class SwiftDemoHomeVCL: SwiftDemoBaseVCL {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SwiftDemo"
        
        
        self.loadItem(SwiftDemoHomeModel.self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    
    override func openDemoPage(_ item:SwiftDemoBaseItem?) -> Void {
        let title : String = (item?.title)!
        switch title {
        case "AlertController":
            self.openAlertDemo(item)
        default: break
            
        }
    }

}

extension SwiftDemoHomeVCL{
    func openAlertDemo(_ demoItem:SwiftDemoBaseItem?) -> Void {
        let alertDemoVCL = AlertDemoVCL()
        alertDemoVCL.demoItem = demoItem
        
        self.navigationController?.pushViewController(alertDemoVCL, animated: true)
    }
}
