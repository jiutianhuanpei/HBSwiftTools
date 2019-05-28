//
//  HBUI+Category.swift
//  SwiftTools
//
//  Created by 沈红榜 on 2019/5/28.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit

extension UIView {
    
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


extension UITableView {
    func registerCells(_ cellClasses: AnyClass ...) {
        for cl in cellClasses {
            register(cl, forCellReuseIdentifier: "\(cl)")
        }
    }
    
}

extension UIColor {
    
    class func color(_ hexStr: String, alpha: CGFloat = 1) -> UIColor! {
        
        var tmpStr = hexStr.replacingOccurrences(of: "0x", with: "")
        tmpStr = hexStr.replacingOccurrences(of: "#", with: "")
        
        if tmpStr.count != 6 {
            return nil
        }
        
        let redScan = Scanner(string: tmpStr.subString(0..<2))
        let greenScan = Scanner(string: tmpStr.subString(2..<4))
        let blueScan = Scanner(string: tmpStr.subString(4..<6))
        
        var red: UInt32 = 0, green: UInt32 = 0, blue: UInt32 = 0
        
        redScan.scanHexInt32(&red)
        greenScan.scanHexInt32(&green)
        blueScan.scanHexInt32(&blue)
        
        let color = UIColor(red: CGFloat(red) / 255.0,
                            green: CGFloat(green) / 255.0,
                            blue: CGFloat(blue) / 255.0,
                            alpha: alpha)
        return color
    }
    
    class func color(_ hexInt: Int, alpha: CGFloat = 1) -> UIColor {
        
        let red = CGFloat((hexInt & 0xff0000) >> 16)
        let green = CGFloat((hexInt & 0xff00) >> 8)
        let blue = CGFloat(hexInt & 0xff)
        
        let color = UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
        return color
    }
    
}

