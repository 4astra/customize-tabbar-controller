//
//  UIImage+Utils.swift
//  Custom-TabBar-Controller
//
//  Created by Minh Dat Giap on 9/25/15.
//  Copyright © 2015 Hoat Ha Van. All rights reserved.
//

import UIKit

extension UIImage{
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}