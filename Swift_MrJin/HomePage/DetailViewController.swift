//
//  DetailViewController.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/2.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    var titleStr: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title=titleStr
        
        view.backgroundColor=UIColor.orange;
        
    }
    
    deinit { //类似oc的dealloc方法
        //print(class_getName(UIViewController.self))
    }
}
