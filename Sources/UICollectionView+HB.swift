//
//  UICollectionView+HB.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/26.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    /// 注册 cell， indentifier == "\(class)"
    ///
    /// - Parameter cellClasses: cell 的类
    func registerCells(_ cellClasses: AnyClass ...) {
        for cl in cellClasses {
            register(cl, forCellWithReuseIdentifier: "\(cl)")
        }
    }
    
    /// 注册区头，indentifier == "\(class)"
    ///
    /// - Parameter viewClasses: 区头 view 的类
    func registerSectionHeaders(_ viewClasses: AnyClass ...) {
        for cl in viewClasses {
            register(cl, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(cl)")
        }
    }
    
    /// 注册区尾， indentifier == "\(class)"
    ///
    /// - Parameter viewClasses: 区尾 view 的类
    func registerSectionFooters(_ viewClasses: AnyClass ...) {
        for cl in viewClasses {
            register(cl, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "\(cl)")
        }
    }
    
}
