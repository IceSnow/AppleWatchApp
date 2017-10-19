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
    
    class func get(_ urlStr: String, finshed: @escaping (_ data: Data?)->(), failure: @escaping (_ error: Error)->()) -> URLSessionDataTask? {
        
        guard let url = URL(string: urlStr) else {
            
            failure(NSError(domain: "无效URL字符串", code: 1, userInfo: nil))
            return nil
        }
        
        // 会话配置
        let sessionConf = URLSessionConfiguration()
        sessionConf.timeoutIntervalForRequest = 8
        
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
    
    
}
