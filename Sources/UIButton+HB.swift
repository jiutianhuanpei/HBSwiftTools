//
//  UIButton+HB.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/26.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit

public extension UIButton {
    
    
    /// 设置按钮的文本、文本颜色
    ///
    /// - Parameters:
    ///   - title: 文本
    ///   - titleColor: 文本颜色
    ///   - state: 状态
    func set(title: String?, titleColor: UIColor?, for state: UIControl.State) {
        setTitle(title, for: state)
        setTitleColor(titleColor, for: state)
    }
}
