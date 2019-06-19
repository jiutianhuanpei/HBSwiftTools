//
//  HBUI+Block.swift
//  SwiftTools
//
//  Created by 沈红榜 on 2019/6/1.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit
import ObjectiveC


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

extension UIControl {
    
    
    private struct ButtonKeys {
        static var ActionClosureKey = "ActionClosureKey"
    }
    private var actionClosure: (UIControl)->Void {
        set {
            objc_setAssociatedObject(self, &ButtonKeys.ActionClosureKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            let result = objc_getAssociatedObject(self, &ButtonKeys.ActionClosureKey) as! (UIControl)->Void
            return result
        }
    }
    
    
    /// 初始化一个控制控件
    ///
    /// - Parameters:
    ///   - event: 触发事件方式，default: touchUpInside
    ///   - action: 事件回调
    convenience init(with event: UIControl.Event = UIControl.Event.touchUpInside, action: @escaping (UIControl)->Void) {
        self.init()
        actionClosure = action
        addTarget(self, action: #selector(hb_touchControl), for: event)
    }
    
    @objc fileprivate func hb_touchControl()  {
        actionClosure(self)
    }
    
    
    
}
