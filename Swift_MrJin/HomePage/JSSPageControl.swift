//
//  JSSPageControl.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/9.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class JSSPageControl: UIPageControl {

    override var currentPage: Int{
        
        didSet{
            for idx in 0..<self.subviews.count {
                
                let v = self.subviews[idx]
                
                v.layer.cornerRadius = 2.5
                
                v.frame=CGRect(x:v.frame.origin.x,y:v.frame.origin.y,width:5,height:5)
            }
        }
    }
}
