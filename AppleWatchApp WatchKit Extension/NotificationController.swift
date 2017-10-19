//
//  NotificationController.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by 杨昌达 on 2017/10/8.
//  Copyright © 2017年 杨昌达. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications

// 图片1.http://www.sucaitianxia.com/png/UploadFiles_6130/200803/20080321003432189.png
// 图片2. http://pics.sc.chinaz.com/files/pic/pic9/201508/apic14052.jpg

/// 
class NotificationController: WKUserNotificationInterfaceController {

    /// UI - 图片
    @IBOutlet var image: WKInterfaceImage!
    /// UI - 主体文本
    @IBOutlet var bodyLabel: WKInterfaceLabel!
    
    
    
    
    override init() {
        // Initialize variables here.
        super.init()
        
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

    override func didReceive(_ notification: UNNotification, withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Swift.Void) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        
        
        let userInfo = notification.request.content.userInfo
        
        if let aps = userInfo["aps"] as? [AnyHashable: Any] {
            
            if let alert = aps["alert"] as? [AnyHashable: Any] {
                
                if let body = alert["body"] as? String {// 设置主体
                    bodyLabel.setText(body)
                }
            }
        }
        
    
        if let imageURL = userInfo["imageURL"] as? String {
            
            if let url = URL(string: imageURL) {
                
                weak var weakself = self
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    
                    if let error = error {
                        print(error)
                    }
                    weakself?.image.setImageData(data)
                    completionHandler(.custom)
                }
                task.resume()
            } else {
                
                print("无效图片链接")
                completionHandler(.custom)
            }
            
        } else {
            
            completionHandler(.default)
        }
    }
}

class NotificationController2: WKUserNotificationInterfaceController {
    
    /// UI - 图片
    @IBOutlet var image: WKInterfaceImage!
    /// UI - 主体文本
    @IBOutlet var bodyLabel: WKInterfaceLabel!
    
    
    override init() {
        // Initialize variables here.
        super.init()
        
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
    
    override func didReceive(_ notification: UNNotification, withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Swift.Void) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        
        
        let userInfo = notification.request.content.userInfo
        
        if let imageURL = userInfo["imageURL"] as? String {
            
            weak var weakself = self
            _ = NetworkManager.get(imageURL, finshed: { (data) in
                
                if let data = data {
                    weakself?.image.setImageData(data)
                }
                completionHandler(.custom)
            }, failure: { (error) in
                
                completionHandler(.custom)
            })
            
        } else {
            
            completionHandler(.default)
        }
    }
    
}
