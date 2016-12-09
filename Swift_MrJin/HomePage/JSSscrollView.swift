//
//  JSSscrollView.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/5.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

class JSSscrollView: UIView {
    
    fileprivate var collectionView:UICollectionView!
    
    //MARK: 属性
    fileprivate var pageControl:JSSPageControl?
    fileprivate var timer:Timer?
    fileprivate var index:Int = 0
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        imageArray=[UIColor.orange] //设置初始值
        
        initSubViews()
    }
    
    //MARK: 图片数组set方法
    var imageArray:[AnyObject]?{
        didSet{
            
            index = 0
            
            // 图片以 3 1 2 3 1 规则放置
            if (imageArray?.count)!>1 {
                imageArray?.append((imageArray?.first)!)
                imageArray?.insert((imageArray?[(imageArray?.count)!-2])!, at: 0)
            }
            
            timer?.invalidate() //先销毁定时器 再创建
            
            if (imageArray?.count)!>1 {
                startTimer()
            }
            pageControl?.currentPage=0
            pageControl?.numberOfPages=(imageArray?.count)!-2
            
            collectionView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        timer?.invalidate()
    }
}
extension JSSscrollView:UICollectionViewDelegate,UICollectionViewDataSource{
    
    fileprivate func initSubViews(){
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize=bounds.size;
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing=0
        flowLayout.minimumInteritemSpacing=0
        
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled=true
        collectionView.backgroundColor=UIColor.white
        collectionView.bounces=false
        collectionView.showsHorizontalScrollIndicator=false
        collectionView.register(JSSCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.delegate=self
        collectionView.dataSource=self
        addSubview(collectionView!)
        
        //添加pageControl
        pageControl=JSSPageControl.init(frame: CGRect(x:(bounds.width-150)/2, y:(bounds.height-40), width: 150, height: 40))
        pageControl?.currentPage=0
        pageControl?.numberOfPages=(imageArray?.count)!-2
        pageControl?.currentPageIndicatorTintColor=UIColor.lightGray
        pageControl?.pageIndicatorTintColor=UIColor.darkGray
        pageControl?.hidesForSinglePage=true
        addSubview(pageControl!)
        
        if (imageArray?.count)!>1 {
            //初始设置第二张位置
            collectionView.scrollToItem(at: IndexPath.init(row: 1, section: 0), at: .centeredHorizontally, animated: false)
     
            startTimer()
        }
    }
    
    fileprivate func startTimer(){
        
        timer = Timer.init(timeInterval: 3, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        let runloop = RunLoop.current
        runloop.add(timer!, forMode: RunLoopMode.commonModes)
    }
    
    //代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imageArray?.count)!;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! JSSCollectionViewCell
        
        cell.setImage(imageArr: imageArray!, idx: indexPath.item)
        
        return cell
    }
}

extension JSSscrollView{
    
    @objc fileprivate func timerAction(){
        index += 1
        
        collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }

    //scrollerView 代理
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        if index==(imageArray?.count)!-1 {
            collectionView.scrollToItem(at: IndexPath.init(row: 1, section: 0), at: .centeredHorizontally, animated: false)
            
            index=1
        }
        
        pageControl?.currentPage=index-1
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var currentPage = Int(scrollView.contentOffset.x / kSCREEN_W)
        
        if currentPage==0 { //滚动到第一个 向左滚
            collectionView.scrollToItem(at: IndexPath.init(row: (imageArray?.count)!-2, section: 0), at: .centeredHorizontally, animated: false)
            currentPage=(imageArray?.count)!-2;
        }
        
        if currentPage == (imageArray?.count)!-1 { //滚动到最后一个 向右滚
            collectionView.scrollToItem(at: IndexPath.init(row: 1, section: 0), at: .centeredHorizontally, animated: false)
            currentPage=1;
        }
        
        pageControl?.currentPage=currentPage-1
        index=(pageControl?.currentPage)!
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        timer?.invalidate()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if (imageArray?.count)!>1 {
            
            startTimer()
        }
    }
}
