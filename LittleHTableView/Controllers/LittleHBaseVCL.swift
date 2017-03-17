//
//  LittleHBaseVCL.swift
//  LittleHTableViewDemo
//
//  Created by tuan800 on 2017/3/15.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class LittleHBaseVCL: UIViewController {
    open var model:LittleHTableViewBaseModel?
    open var paramDict:NSDictionary?
    
    override open  func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override open  func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    open func setParameters(_ params:NSDictionary?) {
        self.paramDict = params
    }
}
