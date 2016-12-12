//
//  NetworkingTool.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/12.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit
import Alamofire

class NetworkingTool: NSObject {

    //MARK: 单例
    static let shareNetwork = NetworkingTool()
    private override init() {}
    
    
    func GetMethodRequest(_ finished:(_ recommendTopics: String) -> ()){

        let url = "http://c.m.163.com/nc/video/Tlist/T1464751736259/0-10.html"
        
         Alamofire.request(url, method: .get).response(completionHandler: { (result) in
            
            print(result);
            
            //finished(recommendTopics: result)
         })
        
        
        
    }
}
