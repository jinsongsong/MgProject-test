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
    
    
    func GetMethodRequest(urlStr:String, parameters:[String : AnyObject], success: @escaping (_ response :[String : AnyObject])->()){
        
        Alamofire.request(urlStr,method: .get, parameters:parameters).responseJSON { (dataResponse) in
            
            guard dataResponse.result.isSuccess else{
                //失败 Do Something
                print("failure")
                return
            }
            
            if let json = dataResponse.result.value{  //判断是否成功
                
                success(json as! [String : AnyObject])
                
            }else{
                
                //失败
                
            }
//            //判断是否成功
//            switch dataResponse.result{
//            case .success:
//                print("success")
//                break
//            case .failure:
//                print("failure")
//                break
//            }
        }
    }
}
