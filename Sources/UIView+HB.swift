//
//  UIView+HB.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/26.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit

public extension UIView {
    
    //MARK:- 属性
    var x: CGFloat {
        set {
            let rect = CGRect.init(x: newValue, y: frame.minY, width: frame.width, height: frame.height)
            frame = rect
        }
        get {
            return frame.minX
        }
    }
    
    var y: CGFloat{
        set {
            let rect = CGRect.init(x: frame.minX, y: newValue, width: frame.width, height: frame.height)
            frame = rect
        }
        get {
            return frame.minY
        }
    }
    
    var width: CGFloat {
        set {
            let rect = CGRect.init(x: frame.minX, y: frame.minY, width: newValue, height: frame.height)
            frame = rect
        }
        get {
            return frame.width
        }
    }
    
    var height: CGFloat {
        set {
            let rect = CGRect.init(x: frame.minX, y: frame.minY, width: frame.width, height: newValue)
            frame = rect
            
        }
        get {
            return frame.height
        }
    }
    
    //    MARK:- 方法
    func addSubViews(_ views: UIView ...) {
        for v in views {
            addSubview(v)
        }
    }
}
