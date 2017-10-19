//
//  NetworkManager.swift
//  AppleWatchApp
//
//  Created by Roster on 19/10/2017.
//  Copyright © 2017 杨昌达. All rights reserved.
//

import Foundation

/// 网络管理
class NetworkManager: NSObject {
    
    /// 获取二进制数据
    class func get(_ urlStr: String, finshed: @escaping (_ data: Data?)->(), failure: @escaping (_ error: Error)->()) -> URLSessionDataTask? {
        
        guard let url = URL(string: urlStr) else {
            
            failure(NSError(domain: "无效URL字符串", code: 1, userInfo: nil))
            return nil
        }
        
        // 会话配置
        let sessionConf = URLSessionConfiguration.default
        if #available(iOS 11.0, *) {
            sessionConf.waitsForConnectivity = true
        } else {
            // Fallback on earlier versions
        }
        sessionConf.timeoutIntervalForRequest = 12
        
        let session = URLSession(configuration: sessionConf)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if (error != nil) {
                
                failure(error!)
            } else {
                
                finshed(data)
            }
        }
        
        task.resume()
        return task
    }
    
    /// 获取对象
    class func getObj(_ urlStr: String, finshed: @escaping (_ obj: Any?)->(), failure: @escaping (_ error: Error)->()) -> URLSessionDataTask? {
        
        guard let url = URL(string: urlStr) else {
            
            failure(NSError(domain: "无效URL字符串", code: 1, userInfo: nil))
            return nil
        }
        
        // 会话配置
        let sessionConf = URLSessionConfiguration.default
        if #available(iOS 11.0, *) {
            sessionConf.waitsForConnectivity = true
        } else {
            // Fallback on earlier versions
        }
        sessionConf.timeoutIntervalForRequest = 12
        
        let session = URLSession(configuration: sessionConf)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if (error != nil) {
                
                failure(error!)
            } else {
                
                if let data = data {
                    let text = String(data: data, encoding: .utf8)
                    print("response: " + (text == nil ? "nil" : "\(text!)"))
                    let obj = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    finshed(obj)
                } else {
                    finshed(nil)
                }
            }
        }
        
        task.resume()
        return task
    }
    
    
    
}
