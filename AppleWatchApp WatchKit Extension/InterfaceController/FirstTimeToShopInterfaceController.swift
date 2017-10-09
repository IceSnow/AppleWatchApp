//
//  FirstTimeToShopInterfaceController.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by Roster on 09/10/2017.
//  Copyright © 2017 杨昌达. All rights reserved.
//

import WatchKit
import Foundation


/// Interface Controller - 初次到店
class FirstTimeToShopInterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        // 传递内容检查
        if let context = context as? [String: Any] {
            
            if let isCurrentPage = context["isCurrentPage"] as? Bool, isCurrentPage == true {
                
                becomeCurrentPage()
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
