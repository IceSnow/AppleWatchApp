//
//  InterfaceController.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by 杨昌达 on 2017/10/8.
//  Copyright © 2017年 杨昌达. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications


/// Interface Controller - Main
class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
//        self.dis
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Action
    // Action - 初次到店
    @IBAction func fristComeAction() {
        
        // push
        pushController(withName: "ArrivalsShopInterfaceControllerID", context: ["menuTypeID": 0])
        
        // reloadRootPageControllers
//        WKInterfaceController.reloadRootPageControllers(withNames: ["FristComeIC", "AgainComeIC"], contexts: nil, orientation: .horizontal, pageIndex: 0)
        
        // presentController
//        presentController(withNames: ["FristComeIC", "AgainComeIC"], contexts: [["isCurrentPage": true], ["isCurrentPage": false]])
    }
    
    // Action - 再次到店
    @IBAction func againComeAction() {
        pushController(withName: "ArrivalsShopInterfaceControllerID", context: ["menuTypeID": 1])
        
        // Push Controller
//        pushController(withName: "FristComeIC", context: ["isCurrentPage": false])
        
        // PresentController
//        presentController(withNames: ["FristComeIC", "AgainComeIC"], contexts: [["isCurrentPage": false], ["isCurrentPage": true]])
    }
}

extension InterfaceController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        pushController(withName: "ArrivalsShopInterfaceControllerID", context: ["menuTypeID": 0])
        print("收到通知Action")
        completionHandler()
    }
    
    
    
}


