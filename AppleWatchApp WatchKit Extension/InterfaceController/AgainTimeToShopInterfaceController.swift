//
//  AgainTimeToShopInterfaceController.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by Roster on 09/10/2017.
//  Copyright © 2017 杨昌达. All rights reserved.
//

import WatchKit
import Foundation


/// Interface Controller - 再次到店
class AgainTimeToShopInterfaceController: WKInterfaceController {

    /// UI - 列表
    @IBOutlet var list: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        // 传递内容检查
        if let context = context as? [String: Any] {
            
            if let isCurrentPage = context["isCurrentPage"] as? Bool, isCurrentPage == true {
                
                becomeCurrentPage()
            }
        }
        
        // 配置列表视图
        settingListItmes()
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Private Method
    
    /// 配置列表单元
    func settingListItmes() {
        
        list.setNumberOfRows(10, withRowType: "AgainTimeToShopObjectID")
        
        for index in 0..<list.numberOfRows {
            
            let row = list.rowController(at: index) as! AgainTimeToShopObject
            
            row.personNumberLabel.setText("\(index)人")
        }
    }

}
