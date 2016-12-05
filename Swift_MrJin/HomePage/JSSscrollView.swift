//
//  JSSscrollView.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/5.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class JSSscrollView: UIView {
    fileprivate let flowLayout=UICollectionViewLayout()
    fileprivate var collectionView=UICollectionView()
    
    override init(frame: CGRect){
        super.init(frame: frame);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 属性
    fileprivate let count = 5
    fileprivate var pageControl:UIPageControl?
    fileprivate var timer:Timer?
    fileprivate var index:Int = 0
    fileprivate var isScroll:Bool = false
    //MARK: 图片数组
    public var imageArray:[String]?
    
    @objc fileprivate func timerAction(){
    
        if index==count {
            
            let indexPath=IndexPath.init(item: 0, section: 2)
            
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}
extension JSSscrollView{
    fileprivate func initSubViews(){
        imageArray=[String]();
        
        //声明可变空字典 updateValue改变值 添加值
//        var dic=Dictionary<String,String>()
//        dic.updateValue("你好", forKey: "你好")
//        print(dic);
        
        //for i in
    }
}
