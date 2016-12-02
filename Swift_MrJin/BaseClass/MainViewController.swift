//
//  MainViewController.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/2.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent=false;
        
        //tabBar.barTintColor=UIColor.orange;
        
        setUpUI();
    }
}
extension MainViewController{  //类扩展
    
    //fileprivate来显式的表明，这个元素的访问权限为文件内私有 private则是真正的私有，离开了这个类或者结构体的作用域外面就无法访问
    fileprivate func setUpUI(){
        addChildViewController(title: "首页", vc: HomePageViewController(), imgName: "首页");
        addChildViewController(title: "图片", vc: SecondViewController(), imgName: "图片");
        addChildViewController(title: "我的", vc: ThirdViewController(), imgName: "我的");
    }
    
    fileprivate func addChildViewController(title:String, vc:UIViewController, imgName:String) {
        
        vc.title=title;
        vc.tabBarItem.title = title;
        vc.tabBarItem.image = UIImage(named:imgName);
        vc.tabBarItem.selectedImage = UIImage(named: imgName+"1")?.withRenderingMode(.alwaysOriginal);
        
        //设置文字颜色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:kRGB(r: 135, g: 135, b: 135, a: 1)], for: .normal);
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:kRGB(r: 229, g: 40, b: 54, a: 1)], for: .selected);
        
        //修改文字偏移量 水平 垂直
        //vc.tabBarItem.titlePositionAdjustment=UIOffsetMake(0, -5);
        
        let nav = UINavigationController(rootViewController: vc);
        
        addChildViewController(nav);
    }
}
