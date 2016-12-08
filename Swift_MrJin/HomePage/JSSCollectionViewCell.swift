//
//  JSSCollectionViewCell.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/7.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class JSSCollectionViewCell: UICollectionViewCell {
    override init(frame:CGRect){
        super.init(frame: frame)
        initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //声明全局
    fileprivate var imageView:UIImageView!
    
    //赋值
    func setImage(imageArr:NSArray, idx:NSInteger){
        //imageView.image=UIImage.init(named: "\(imageArr[idx])")
        
        var arr=[UIColor.blue,UIColor.red,UIColor.orange,UIColor.blue,UIColor.red];
        
        imageView.backgroundColor=arr[idx];
        
    }
}
extension JSSCollectionViewCell{
    
    fileprivate func initSubViews(){
        imageView=UIImageView(frame: bounds)
        addSubview(imageView)
    }
}
