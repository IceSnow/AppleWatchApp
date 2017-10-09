//
//  AgainTimeToShopObject.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by Roster on 09/10/2017.
//  Copyright © 2017 杨昌达. All rights reserved.
//

import WatchKit

/// Object - 再次到店
class AgainTimeToShopObject: NSObject {
    
    /// UI - 图片
    @IBOutlet var image: WKInterfaceImage!
    /// UI - 时间
    @IBOutlet var timeLabel: WKInterfaceLabel!
    /// UI - 人数
    @IBOutlet var personNumberLabel: WKInterfaceLabel!
    /// UI - 车型名称
    @IBOutlet var carModelLabel: WKInterfaceLabel!
    /// UI - 用户名
    @IBOutlet var userNameLabel: WKInterfaceLabel!
    
}
