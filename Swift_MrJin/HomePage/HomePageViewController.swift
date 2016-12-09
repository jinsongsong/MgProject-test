//
//  HomePageViewController.swift
//  Swift_MrJin
//
//  Created by YKJ3 on 2016/12/2.
//  Copyright © 2016年 YJK3. All rights reserved.
//

import UIKit

let homeIdentifier:String = "homecell"
let scrollIdentifier:String = "scrollcell"
let listIdentifier:String = "listcell"
let defaultIdentifier:String = "defaultcell"

class HomePageViewController: BaseViewController{
    
    fileprivate var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSubViews()
        
        createrHeaderView()
    }
    
}
extension HomePageViewController{
    
    fileprivate func initSubViews(){
    
        tableView = UITableView(frame: CGRect(x:0, y:0, width:kSCREEN_W, height:kSCREEN_H-(self.tabBarController?.tabBar.frame.height)!), style: .plain)
        tableView?.delegate=self;
        tableView?.dataSource=self;
        tableView.tableFooterView=UIView();
        self.view.addSubview(tableView!);
        tableView? .register(UITableViewCell.self, forCellReuseIdentifier: homeIdentifier)
    }
    
    fileprivate func createrHeaderView(){
        let scroller = JSSscrollView.init(frame: CGRect(x:0,y:0,width:kSCREEN_W,height:200))
        scroller.imageArray=[UIColor.orange,UIColor.black,UIColor.yellow,UIColor.brown]
        tableView.tableHeaderView=scroller
    }
}

extension HomePageViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: homeIdentifier, for: indexPath) 
        
        cell.textLabel?.text="\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        
        self.navigationController?.pushViewController(DetailViewController(), animated: true);
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > -64 && scrollView.contentOffset.y < 0 {
            
            self.navigationController?.navigationBar.subviews[0].alpha = 1 - fabs(scrollView.contentOffset.y/100.0)
        }
    }
}
