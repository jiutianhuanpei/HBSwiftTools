
//
//  HBFoundation+Category.swift
//  SwiftTools
//
//  Created by 沈红榜 on 2019/5/28.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    //    MARK:- 字符串截取
    /// 获取字符串的子字符串，若区间在字符串外，会返回 ""
    ///
    /// - Parameter range: 要获取的字符串区间
    /// - Returns: 子字符串
    func subString(_ range: Range<Int>) -> String {
        
        let a = range.lowerBound, b = range.upperBound
        return _HBSubString(from: a, to: b)
    }
    func subString(_ range: ClosedRange<Int>) -> String {
        
        let a = range.lowerBound, b = range.upperBound
        return _HBSubString(from: a, to: b)
    }
    func subString(_ range: PartialRangeThrough<Int>) -> String {
        
        let a = 0, b = range.upperBound
        return _HBSubString(from: a, to: b)
    }
    func subString(_ range: PartialRangeFrom<Int>) -> String {
        
        let a = range.lowerBound, b = count
        return _HBSubString(from: a, to: b)
    }
    
    private func _HBSubString(from: Int, to: Int) -> String {
        let a = max(0, from)
        let b = min(count, to)
        
        if a >= b {
            return ""
        }
        
        let start = index(startIndex, offsetBy: a)
        let end = index(startIndex, offsetBy: b)
        
        let str = self[start..<end]
        
        return String(str)
    }
    
    //    MAKR:- md5加密
    
    /// 获取字符串的 md5 值
    var md5: String {
        
        let disg = UnsafeMutablePointer<UInt8>.allocate(capacity: 0)
        
        guard let cStr = cString(using: .utf8) else {
            return ""
        }
        
        CC_MD5(cStr, CC_LONG(strlen(cStr)), disg)
        
        var md5Str = ""
        
        for index in 0..<CC_MD5_DIGEST_LENGTH {
            md5Str = md5Str.appendingFormat("%02x", disg[Int(index)])
        }
        
        return md5Str
    }
    
    
    
}

extension Dictionary {
    func string(for key: Key) -> String {
        
        return _HBValue(key, default: "")
    }
    
    func int(for key: Key) -> Int {
        return _HBValue(key, default: 0)
    }
    
    func bool(for key: Key) -> Bool {
        return _HBValue(key, default: false)
    }
    
    func float(for key: Key) -> Float {
        return _HBValue(key, default: 0.0)
    }
    
    
    fileprivate func _HBValue<T>(_ key: Key, `default`: T) -> T {
        return (self[key] as? T) ?? `default`
    }
}

extension Data {
    
    /// 获取 二进制文件 的 md5 值
    var md5: String {
        
        var ctx = CC_MD5_CTX()
        
        CC_MD5_Init(&ctx)
        
        var data = self
        
        CC_MD5_Update(&ctx, &data, CC_LONG(count))
        
        let disg = UnsafeMutablePointer<UInt8>.allocate(capacity: 0)
        
        CC_MD5_Final(disg, &ctx)
        
        var result = ""
        
        for idx in 0..<CC_MD5_DIGEST_LENGTH {
            result = result.appendingFormat("%02x", disg[Int(idx)])
        }
        return result
    }
    
    
    
}

