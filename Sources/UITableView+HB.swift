//
//  UITableView+HB.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/26.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit

public extension UITableView {
    
    /// 注册 cell，对应的 identifier 为 "\(class)"
    ///
    /// - Parameter cellClasses: cell 的类
    func registerCells(_ cellClasses: AnyClass ...) {
        for cl in cellClasses {
            register(cl, forCellReuseIdentifier: "\(cl)")
        }
    }
    
    /// 注册 header footer，对应的 identifier 为 "\(class)"
    ///
    /// - Parameter viewClasses: header footer 的类
    func registerHeaderFooterViews(_ viewClasses: AnyClass ...) {
        for cl in viewClasses {
            register(cl, forHeaderFooterViewReuseIdentifier: "\(cl)")
        }
    }
    
    
}
