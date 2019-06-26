//
//  UIColor+HB.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/26.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// 十六位颜色
    ///
    /// - Parameters:
    ///   - hexStr: eg. "0xffffff", "#0xffffff", "ffffff"
    ///   - alpha: 透明度，default = 1
    /// - Returns: color
    convenience init?(_ hexStr: String, alpha: CGFloat = 1) {
        
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
        
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: alpha)
    }
    
    /// 十六位颜色
    ///
    /// - Parameters:
    ///   - hexInt: eg. 0xffffff
    ///   - alpha: 透明度
    /// - Returns: color
    convenience init(_ hexInt: Int, alpha: CGFloat = 1) {
        
        let red = CGFloat((hexInt & 0xff0000) >> 16)
        let green = CGFloat((hexInt & 0xff00) >> 8)
        let blue = CGFloat(hexInt & 0xff)
        
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}
