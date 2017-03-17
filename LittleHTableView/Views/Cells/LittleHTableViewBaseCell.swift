//
//  LittleHTableViewBaseCell.swift
//  LittleHTableViewDemo
//
//  Created by tuan800 on 2017/3/14.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

public class LittleHTableViewBaseCell: UITableViewCell {
    var lineLayer : CALayer?
    var _object:AnyObject?
    var needShowLineLayer:Bool = false
    
    public var item:AnyObject? {
        get {
            return _object
        }
    }
    
    public func setObject (_ obj:AnyObject?) -> Void {
        _object = obj
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public class func tableView(_ tableView: UITableView, rowHeightForObject object: AnyObject) -> CGFloat {
        return 0
    }
    
    public class func LittleHIdentifier() -> String {
        return "\(LittleHTableViewBaseCell.self)"
    }
    
    required public override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createLineLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLineLayer() -> Void{
        let line = CALayer()
        line.backgroundColor = UIColor.lightGray.cgColor
        
        self.contentView.layer.addSublayer(line)
        
        self.lineLayer = line
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.lineLayer?.isHidden = !self.needShowLineLayer;
        if self.needShowLineLayer {
            self.lineLayer?.frame = CGRect.init(x: 0, y: self.contentView.bounds.height - 0.5, width: self.contentView.bounds.width, height: 0.5)
        }
    }

}
