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
    fileprivate let count = 5
    fileprivate var pageControl:UIPageControl?
    fileprivate var timer:Timer?
    fileprivate var index:Int = 0
    fileprivate var isScroll:Bool = false
    
    //MARK: 图片数组
    public var imageArray:[String]?

    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func timerAction(){
    
        if index==count {
            
            let indexPath=IndexPath.init(item: 0, section: 2)
            
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            
        }
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
        
        //初始设置第二张位置
        collectionView.scrollToItem(at: IndexPath.init(row: 1, section: 0), at: .centeredHorizontally, animated: false)
        
        //添加pageControl
        pageControl=UIPageControl.init(frame: CGRect(x:(bounds.width-150)/2, y:(bounds.height-40), width: 150, height: 40))
        pageControl?.numberOfPages=3  //(imageArray?.count)!-2
        pageControl?.currentPage=0
        pageControl?.currentPageIndicatorTintColor=UIColor.lightGray
        pageControl?.pageIndicatorTintColor=UIColor.darkGray
        addSubview(pageControl!)
        
        startTimer()
        
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
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! JSSCollectionViewCell
        
        cell .setImage(imageArr: [], idx: indexPath.item)
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var currentPage = Int(scrollView.contentOffset.x / kSCREEN_W)
        
        //判断滚动到头尾时 改变偏移量
        if currentPage==0 {
            collectionView.scrollToItem(at: IndexPath.init(row: 3, section: 0), at: .centeredHorizontally, animated: false)
            currentPage=3;
        }
        
        if currentPage == 4 {
            collectionView.scrollToItem(at: IndexPath.init(row: 1, section: 0), at: .centeredHorizontally, animated: false)
            currentPage=1;
        }
        
        pageControl?.currentPage=currentPage-1
    }
}
