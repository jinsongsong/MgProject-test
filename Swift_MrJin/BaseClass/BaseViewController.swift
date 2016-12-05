//
//  BaseViewController.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/2.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBackBtn();
    }

    //返回按钮
    func initBackBtn(){
        if(navigationController!.viewControllers.count>1||(self.presentingViewController != nil)){
            
            navigationController?.navigationBar.tintColor=UIColor.white;
            
            let backBtn = UIBarButtonItem.init(image: UIImage(named:"NavBack_btn"), style: UIBarButtonItemStyle.plain, target: self, action:#selector(backAction))
            
            navigationItem.leftBarButtonItem=backBtn;
        }
    }
    
    func backAction(){
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
