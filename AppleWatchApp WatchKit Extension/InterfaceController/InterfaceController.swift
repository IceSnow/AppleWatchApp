//
//  InterfaceController.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by 杨昌达 on 2017/10/8.
//  Copyright © 2017年 杨昌达. All rights reserved.
//

import WatchKit
import Foundation


/// Interface Controller - Main
class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // Action - 初次到店
    @IBAction func fristComeAction() {
        
//        WKInterfaceController.reloadRootPageControllers(withNames: ["FristComeIC", "AgainComeIC"], contexts: nil, orientation: .horizontal, pageIndex: 0)
//        pushController(withName: "FristComeIC", context: ["isCurrentPage": true])
//        presentController(withNames: ["FristComeIC", "AgainComeIC"], contexts: [["isCurrentPage": true], ["isCurrentPage": false]])
    }
    
    // Action - 再次到店
    @IBAction func againComeAction() {
        
//        pushController(withName: "FristComeIC", context: ["isCurrentPage": false])
//        presentController(withNames: ["FristComeIC", "AgainComeIC"], contexts: [["isCurrentPage": false], ["isCurrentPage": true]])
    }
    
    
    
}
