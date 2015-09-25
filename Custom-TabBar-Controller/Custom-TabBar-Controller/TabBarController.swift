//
//  TabBarController.swift
//  Custom-TabBar-Controller
//
//  Created by Minh Dat Giap on 9/25/15.
//  Copyright © 2015 Hoat Ha Van. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var arrBarItems: NSMutableArray?
    var numberTabBar: Int!
    let heightDefault: CGFloat! = 49.0
    @IBOutlet var ibViewTabBar: UIView?
    
    //select tab bar item at index
    func selectTabBarItem(index: Int){
        for item  in arrBarItems! {
            let tabBarItem = item as! TabBarView
            tabBarItem.ibButton!.selected = (tabBarItem.ibButton!.tag == index ? true: false)
        }
        self.selectedIndex = index
    }
    
    //event click
    @IBAction func onClick(sender: UIButton){
        selectTabBarItem(sender.tag)
    }
    
    func initTabBarView(){
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        ibViewTabBar = UIView.init(frame: CGRectMake(0, CGRectGetHeight(UIScreen.mainScreen().bounds)-CGFloat(heightDefault), CGRectGetWidth(UIScreen.mainScreen().bounds), heightDefault))
        ibViewTabBar!.backgroundColor = UIColor.whiteColor()
        ibViewTabBar!.layer.borderColor = UIColor.lightGrayColor().CGColor
        ibViewTabBar!.layer.borderWidth = 1.0
        var posX:CGFloat = 0.0
        let width = (CGRectGetWidth(UIScreen.mainScreen().bounds) / CGFloat(numberTabBar))
        
        for var i = 0; i < numberTabBar!; i++ {
            
            let tabBarItem: TabBarView = TabBarView.init(frame: CGRectMake(posX, 0, width , heightDefault))
            
            let imageSelected = UIImage.imageWithColor(UIColor.lightGrayColor())
            let imageUnSelected = UIImage.imageWithColor(UIColor.groupTableViewBackgroundColor())
            
            tabBarItem.initTabBarView(imageSelected, imageUnSelect: imageUnSelected, title: NSString.init(format: "Tab: %d", i) as String)
            
            tabBarItem.ibButton?.tag = i
            tabBarItem.ibButton?.addTarget(self, action: "onClick:", forControlEvents: UIControlEvents.TouchUpInside)

            arrBarItems!.addObject(tabBarItem)
            ibViewTabBar!.addSubview(tabBarItem)
            posX = posX + width
        }
        
        let maxEdge: CGFloat = CGRectGetMaxX(ibViewTabBar!.frame)
        if posX < maxEdge {
            for item in arrBarItems! {
                let barItem = item as! TabBarView
                barItem.frame = CGRectOffset(barItem.frame, (maxEdge - posX) / 2.0, 0)
            }
        }
        
        
        self.view.addSubview(ibViewTabBar!)
        selectTabBarItem(0);
    }
    
    func initViewController(){
        let viewController1 = UIViewController.init()
        viewController1.view.backgroundColor = UIColor.whiteColor()
        let viewController2 = UIViewController.init()
        viewController2.view.backgroundColor = UIColor.lightGrayColor()
        let viewController3 = UIViewController.init()
        viewController3.view.backgroundColor = UIColor.lightTextColor()
        let viewController4 = UIViewController.init()
        viewController4.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        let viewController5 = UIViewController.init()
        viewController5.view.backgroundColor = UIColor.whiteColor()
        self.viewControllers = [viewController1, viewController2, viewController3, viewController4, viewController5]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberTabBar = 5
        
        arrBarItems = NSMutableArray.init(capacity: numberTabBar!)
        
        //hidden the TabBar bottom default
        self.tabBar.hidden = true
        
        initTabBarView()
        
        initViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
