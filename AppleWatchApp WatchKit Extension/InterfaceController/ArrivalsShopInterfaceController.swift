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
        
        settingListItems()// 初始化配置列表
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
            
            list.setNumberOfRows(5, withRowType: "FristTimeToShopObjectID")
        case .again:// 再次到店
            
            list.setNumberOfRows(6, withRowType: "AgainTimeToShopObjectID")
        }
        
        // setting rows
        for index in 0..<list.numberOfRows {
            
            
            switch menuType {
            case .frist:
                
                let row = list.rowController(at: index) as! FristTimeToShopObject
                
                row.personNumLabel.setText("\(index)人")
            case .again:
                
                let row = list.rowController(at: index) as! AgainTimeToShopObject
                
                row.personNumberLabel.setText("\(index)人")
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
