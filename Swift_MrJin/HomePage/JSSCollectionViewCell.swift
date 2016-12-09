//
//  JSSCollectionViewCell.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/7.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class JSSCollectionViewCell: UICollectionViewCell {
    
    //声明全局
    fileprivate var imageView:UIImageView!
    
    override init(frame:CGRect){
        
        super.init(frame: frame)
        
        initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //赋值
    func setImage(imageArr:[AnyObject], idx:NSInteger){
        //imageView.image=UIImage.init(named: "\(imageArr[idx])")
        
        imageView.backgroundColor=imageArr[idx] as? UIColor;
    }
}
extension JSSCollectionViewCell{
    
    fileprivate func initSubViews(){
        imageView=UIImageView(frame: bounds)
        addSubview(imageView)
    }
}
