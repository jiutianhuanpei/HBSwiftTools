//
//  Dictionary+HB.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/26.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    /// 返回字典对应 key 下的 String 类型的 value
    ///
    /// - Parameter key: key
    /// - Returns: value，如果失败则返回 ""
    func string(for key: Key) -> String {
        
        return HBValue(key, default: "")
    }
    
    /// 返回字典对应 key 下的 Int 类型的 value
    ///
    /// - Parameter key: key
    /// - Returns: value，如果失败则返回 0
    func int(for key: Key) -> Int {
        return HBValue(key, default: 0)
    }
    
    /// 返回字典对应 key 下的 Bool 类型的 value
    ///
    /// - Parameter key: key
    /// - Returns: value，如果失败则返回 false
    func bool(for key: Key) -> Bool {
        return HBValue(key, default: false)
    }
    
    /// 返回字典对应 key 下的 Float 类型的 value
    ///
    /// - Parameter key: key
    /// - Returns: value，如果失败则返回 0.0
    func float(for key: Key) -> Float {
        return HBValue(key, default: Float(0))
    }
    
    /// 返回字典对应 key 下的 Float 类型的 value
    ///
    /// - Parameter key: key
    /// - Returns: value，如果失败则返回 0.0
    func double(for key: Key) -> Double {
        return HBValue(key, default: Double(0))
    }
    
    
    /// 返回字典对应 key 下的 T 类型的 value
    /// 如字典为 ["name": "Jim"], 若传入 default == 0: Int, 则因为 "Jim" 转换成 Int 类型会失败，所以方法将返回 0
    ///
    /// - Parameters:
    ///   - key: key
    ///   - `default`: T类型的默认值，
    /// - Returns: 字典对应key下的值，若取值失败则返回默认值
    func HBValue<T>(_ key: Key, `default`: T) -> T {
        return (self[key] as? T) ?? `default`
    }
}
