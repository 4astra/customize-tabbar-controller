//
//  TabBarView.swift
//  Custom-TabBar-Controller
//
//  Created by Minh Dat Giap on 9/25/15.
//  Copyright © 2015 Hoat Ha Van. All rights reserved.
//

import UIKit

class TabBarView: UIView {
    @IBOutlet var ibButton: UIButton?
    @IBOutlet var ibLabel: UILabel?
    var hasTitle: Bool!
    
    func initTabBarView (imageSelected: UIImage? , imageUnSelect: UIImage?, title: String?){
        ibButton!.setBackgroundImage(imageSelected, forState: UIControlState.Selected)
        ibButton!.setBackgroundImage(imageUnSelect, forState: UIControlState.Normal)
        ibButton!.layer.borderWidth = 0.5;
        ibButton!.clipsToBounds = true;
        ibButton!.layer.borderColor = UIColor.lightGrayColor().CGColor;
        ibLabel!.text = title
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        hasTitle = true
        self.backgroundColor = UIColor.clearColor()
        //button
        ibButton = UIButton.init(frame: CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)))
        self.addSubview(ibButton!)
        //label
        if hasTitle! {
            
            ibLabel = UILabel.init(frame: ibButton!.frame)
            ibLabel!.backgroundColor = UIColor.clearColor()
            ibLabel!.textColor = UIColor.grayColor()
            ibLabel!.font = UIFont.init(name: "HelveticaLight", size: 10.0)
            ibLabel!.numberOfLines = 1;
            ibLabel!.textAlignment = NSTextAlignment.Center
            var rect: CGRect = ibLabel!.frame
            let height: CGFloat = CGRectGetHeight(ibButton!.frame)/3 
            rect.origin.y = CGRectGetHeight(ibButton!.frame) - height
            rect.size.height = height
            ibLabel!.frame = rect
            ibButton!.addSubview(ibLabel!)
        }
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
