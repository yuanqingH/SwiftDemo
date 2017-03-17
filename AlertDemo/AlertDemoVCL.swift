//
//  AlertDemoVCL.swift
//  SwiftDemo
//
//  Created by tuan800 on 2017/3/17.
//  Copyright © 2017年 HYQ. All rights reserved.
//

import UIKit

class AlertDemoVCL: SwiftDemoBaseVCL {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Alert Demo"
        self.loadItem(AlertDemoModel.self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func openDemoPage(_ item:SwiftDemoBaseItem?) -> Void{
        let index : NSInteger = (item?.index?.intValue)!
        switch index {
        case 0:
            self.showSimpleAlert()
            break
        case 1:
            self.showAlertSheet()
            break
        case 2:
            self.showAlertForm()
            break
        default:
            break
        }
    }
    
    func showSimpleAlert() -> Void {
        let alertController = UIAlertController(title: "标题", message: "这个是详细的信息", preferredStyle:UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            print("这里写取消的处理事件");
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "确认", style: .default) { _ in
            print("这里写确认的处理事件");
        }
        alertController.addAction(OKAction)
        
        let redAction = UIAlertAction(title:"警告",style:.destructive){_ in
            print("这里写警告的处理事件")
        }
        alertController.addAction(redAction)
        
        self.present(alertController, animated: true, completion:{ () -> Void in
            //成功打开alert后的回调
        })
    }
    
    func showAlertSheet() -> Void {
        let alertController = UIAlertController(title: "标题", message: "这个是详细的信息", preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            print("这里写取消的处理事件");
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "确认", style: .default) { _ in
            print("这里写确认的处理事件");
        }
        alertController.addAction(OKAction)
        
        let redAction = UIAlertAction(title:"警告",style:.destructive){_ in
            print("这里写警告的处理事件")
        }
        alertController.addAction(redAction)
        
        self.present(alertController, animated: true, completion:{ () -> Void in
            //成功打开alert后的回调
        })
    }
    
    func showAlertForm() -> Void {
        let alertController = UIAlertController(title: "登录", message: "请输入你的账号和密码", preferredStyle:UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            print("你取消了登录");
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "确认", style: .default) { _ in
            print("你确认了登录,输入的信息如下");
            
            let userName = alertController.textFields![0].text
            let password = alertController.textFields![1].text
            
            self.doSomething(userName, password: password)
        }
        alertController.addAction(OKAction)
        
        alertController.addTextField(configurationHandler: {(textField : UITextField!) in
            textField.placeholder = "账号"
            textField.isSecureTextEntry = false
        })
        
        alertController.addTextField(configurationHandler: {(textField : UITextField!) in
            textField.placeholder = "密码"
            textField.isSecureTextEntry = true
        })
        
        self.present(alertController, animated: true, completion:{ () -> Void in
            //成功打开alert后的回调
        })
    }
    
    func doSomething(_ userName: String?, password: String?) {
        print("账号: \(userName ?? "")  密码: \(password ?? "")")
    }

}
