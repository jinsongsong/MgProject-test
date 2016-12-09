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
    fileprivate var pageControl:UIPageControl?
    fileprivate var timer:Timer?
    fileprivate var index:Int = 1
    
    //MARK: 图片数组
    public var imageArray:[AnyObject]?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        imageArray=[UIColor.red,UIColor.orange]
        
        if (imageArray?.count)!>1 {
            imageArray?.append((imageArray?.first)!)
            imageArray?.insert((imageArray?.last)!, at: 0)
        }
        
        initSubViews()
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
        pageControl=UIPageControl.init(frame: CGRect(x:(bounds.width-150)/2, y:(bounds.height-40), width: 150, height: 40))
        pageControl?.numberOfPages=(imageArray?.count)!-2
        pageControl?.currentPage=0
        pageControl?.currentPageIndicatorTintColor=UIColor.lightGray
        pageControl?.pageIndicatorTintColor=UIColor.darkGray
        addSubview(pageControl!)
        
        if (imageArray?.count)!>1 {
            //初始设置第二张位置
            collectionView.scrollToItem(at: IndexPath.init(row: 1, section: 0), at: .centeredHorizontally, animated: false)
            
            startTimer()
        }
    }
    
    fileprivate func startTimer(){
        
        timer = Timer.init(timeInterval: 2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
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
        
        cell .setImage(imageArr: imageArray!, idx: indexPath.item)
        
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
        //[UIColor.orange UIColor.red,UIColor.orange UIColor.red]
        if currentPage==0 { //滚动到第一个
            collectionView.scrollToItem(at: IndexPath.init(row: (imageArray?.count)!-2, section: 0), at: .centeredHorizontally, animated: false)
            currentPage=(imageArray?.count)!-2;
        }
        
        if currentPage == (imageArray?.count)!-1 { //滚动到最后一个
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
