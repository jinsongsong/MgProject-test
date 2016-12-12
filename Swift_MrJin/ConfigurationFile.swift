//
//  ConfigurationFile.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/2.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import Foundation
import UIKit

/** 屏幕宽 */
let kSCREEN_W = UIScreen.main.bounds.width

/** 屏幕高 */
let kSCREEN_H = UIScreen.main.bounds.height

/** RGB颜色 */
func kRGB(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

/** 主颜色 */
var kMainColor = kRGB(r:255, g:255, b:0, a:1)


/** 服务器地址 */
let BASE_URL = "http://lf.snssdk.com/"
