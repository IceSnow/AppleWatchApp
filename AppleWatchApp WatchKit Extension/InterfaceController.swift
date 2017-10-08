//
//  InterfaceController.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by 杨昌达 on 2017/10/8.
//  Copyright © 2017年 杨昌达. All rights reserved.
//

import WatchKit
import Foundation


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
        presentController(withNames: ["FristComeIC"], contexts: nil)
    }
    
    // Action - 再次到店
    @IBAction func againComeAction() {
        
    }
    
    
    
}