//
//  DispatchQueue+HB.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/27.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import Dispatch

// MARK: - DispatchTime 扩展，方便 asyncAfter 方法调用，直接传入 Int、Double 数值就行。
// eg：DispatchQueue.main.asyncAfter(deadline: 2, execute: T##() -> Void)
extension DispatchTime: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    
    public init(integerLiteral value: Int) {
        self = .now() + .seconds(value)
    }
    
    public init(floatLiteral value: Double) {
        self = .now() + .milliseconds(Int(value * 1000))
    }
}


