//
//  HomeModel.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/14.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class HomeModel: NSObject {

    var category: String?
    
    var web_url: String?
    
    var concern_id: String?
    
    var icon_url: String?
    
    var name: String?
    
    var isSelected: Bool = true

    init(dict: [String: AnyObject]) {
        super.init()
        category = dict["category"] as? String
        web_url = dict["web_url"] as? String
        concern_id = dict["concern_id"] as? String
        icon_url = dict["icon_url"] as? String
        name = dict["name"] as? String
    }

}
