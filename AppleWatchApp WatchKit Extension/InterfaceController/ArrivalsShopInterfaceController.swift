//
//  ArrivalsShopInterfaceController.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by Roster on 10/10/2017.
//  Copyright © 2017 杨昌达. All rights reserved.
//

import WatchKit
import Foundation

/// 功能类型
fileprivate enum MenuType: Int {
    /// 初次到店
    case frist = 0
    /// 再次到店
    case again
}

/// Interface Controller - 到店
class ArrivalsShopInterfaceController: WKInterfaceController {

    /// UI - 初始化到店Label
    @IBOutlet var fristToShopLabel: WKInterfaceLabel!
    
    /// UI - 再次到店Label
    @IBOutlet var againToShopLabel: WKInterfaceLabel!
    
    /// UI - 列表
    @IBOutlet var list: WKInterfaceTable!
    
    var data1: [[String: String]] = []
    
    /// 功能类型
    fileprivate var menuType: MenuType = .frist {
        didSet {
            if oldValue == menuType {
                return
            }
            settingListItems()// 更新列表
            settingLabelColor()// 配置顶部文字颜色
        }
    }
    
    fileprivate var menuTypeID: Int = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        // 传递内容检查
        if let context = context as? [String: Any] {
            
            // 配置功能类型
            if let menuTypeID = context["menuTypeID"] as? Int {
                self.menuTypeID = menuTypeID
            }
        }
        
        _ = NetworkManager.getObj("https://gist.githubusercontent.com/IceSnow/2932a6b18934e251c19c3197dd17b0b8/raw/1a3553b6d147f772bbeb22aaf85cb9aa552eee0a/AppleWatchAppDemo.json", finshed: { [weak self] (obj) in
            
            if let obj = obj as? [String: Any] {
                
                if let data = obj["data"] as? [[String: String]] {
                    self?.data1 += data
                    
                    self?.settingListItems()// 更新列表
                    return
                }
            }
            
            print("数据异常")
            
            print("请求成功:" + ((obj != nil) ? "\(obj!)": "nil"))
        }) { (error) in
            
            print("请求失败")
        }
//        settingListItems()// 初始化配置列表
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
        
        
        
        
        if let menuType = MenuType(rawValue: menuTypeID) {
            self.menuType = menuType
        }
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Action
    
    // Action - 初始到店
    @IBAction func fristToShopAction() {
        
        menuType = .frist
    }
    
    // Action - 再次到店
    @IBAction func againToShopAction() {
        
        menuType = .again
    }
    
    
    // MARK: Private Method
    
    /// 配置列表
    func settingListItems() {
        
        // setting number of row
        switch menuType {
        case .frist:// 初次到店
            
            list.setNumberOfRows(data1.count, withRowType: "FristTimeToShopObjectID")
        case .again:// 再次到店
            
            list.setNumberOfRows(data1.count, withRowType: "AgainTimeToShopObjectID")
        }
        
        // setting rows
        for index in 0..<list.numberOfRows {
            
            let item = data1[index]
            switch menuType {
            case .frist:
                
                let row = list.rowController(at: index) as! FristTimeToShopObject
                row.timeLabel.setText("\(item["time"] ?? "0")")
                row.personNumLabel.setText("\(item["title1"] ?? "0")人")
            case .again:
                
                let row = list.rowController(at: index) as! AgainTimeToShopObject
                row.timeLabel.setText("\(item["time"] ?? "0")")
                row.personNumberLabel.setText("\(item["title1"] ?? "0")人")
                row.carModelLabel.setText("\(item["title21"] ?? "")")
                row.userNameLabel.setText("\(item["title22"] ?? "")")
            }
        }
    }
    
    /// 配置顶部文字颜色
    func settingLabelColor() {
        
        let normalColor = UIColor(white: 88/255.0, alpha: 1);
        switch menuType {
        case .frist:
            
            fristToShopLabel.setTextColor(UIColor(red: 54/255.0, green: 135/255.0, blue: 142/255.0, alpha: 1))
            againToShopLabel.setTextColor(normalColor)
        case .again:
            
            fristToShopLabel.setTextColor(normalColor)
            againToShopLabel.setTextColor(UIColor(red: 202/255.0, green: 160/255.0, blue: 97/255.0, alpha: 1))
        }
    }

}
