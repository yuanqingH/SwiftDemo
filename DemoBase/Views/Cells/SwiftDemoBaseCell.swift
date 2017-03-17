//
//  SwiftDemoBaseCell.swift
//  SwiftDemo
//
//  Created by tuan800 on 2017/3/17.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class SwiftDemoBaseCell: LittleHTableViewBaseCell {

    var titleLabel : UILabel?
    
    
    override func setObject(_ obj: AnyObject?) {
        super.setObject(obj)
        self.needShowLineLayer = true
        self.selectionStyle = .none
        if obj is SwiftDemoBaseItem {
            let aItem = obj as? SwiftDemoBaseItem
            self.titleLabel?.text = aItem?.title
        }
        
    }
    
    required public init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.createTitleLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTitleLabel() -> Void {
        let titleLabel = UILabel()
        titleLabel.frame = CGRect.init(x: 10, y: 0, width: UIScreen.main.bounds.width - 20, height: 40)
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        
        self.contentView.addSubview(titleLabel)
        
        self.titleLabel = titleLabel
    }
    
    override class func tableView(_ tableView: UITableView, rowHeightForObject object: AnyObject) -> CGFloat {
        if object is SwiftDemoBaseItem {
            let aItem = object as? SwiftDemoBaseItem
            return (aItem?.height)!
        }
        
        return 0
    }

}
