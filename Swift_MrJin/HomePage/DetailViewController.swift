//
//  DetailViewController.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/2.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="详情页"
        view.backgroundColor=UIColor.orange;
        //let vc = HomePageViewController();
    
    }
    
    deinit { //类似oc的dealloc方法
        print(class_getName(UIViewController.self))
    }
}
