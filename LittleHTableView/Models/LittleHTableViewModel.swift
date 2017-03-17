//
//  LittleHTableViewModel.swift
//  LittleHTableViewDemo
//
//  Created by tuan800 on 2017/3/15.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class LittleHTableViewModel: LittleHTableViewBaseModel {
    var items : NSMutableArray?
    public override init() {
        self.items = NSMutableArray.init(capacity: 10)
    }
}
