
//
//  HBFoundation+Category.swift
//  SwiftTools
//
//  Created by 沈红榜 on 2019/5/28.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import Foundation
import CommonCrypto

public extension String {
    
    //    MARK:-  字符串截取
    
    /// 字符串截取
    ///
    /// - Parameter range: 区间
    /// - Returns: 子字符串
    func subString<T>(_ range: T) -> String {
        
        let begin = startIndex
        
        func hb_stringIndex(_ i: Int) -> String.Index {
            return index(begin, offsetBy: i)
        }
        
        if let kRange = range as? Range<Int> {
            
            let begin = hb_stringIndex(kRange.lowerBound)
            let end = hb_stringIndex(kRange.upperBound)
            return String(self[begin..<end])
            
        } else if let kRange = range as? ClosedRange<Int> {
            
            let begin = hb_stringIndex(kRange.lowerBound)
            let end = hb_stringIndex(kRange.upperBound)
            return String(self[begin...end])
            
        } else if let kRange = range as? PartialRangeThrough<Int> {
            
            let end = hb_stringIndex(kRange.upperBound)
            return String(self[...end])
            
        } else if let kRange = range as? PartialRangeUpTo<Int> {
            
            let end = hb_stringIndex(kRange.upperBound)
            return String(self[..<end])
            
        } else if let kRange = range as? PartialRangeFrom<Int> {
            
            let begin = hb_stringIndex(kRange.lowerBound)
            return String(self[begin...])
        }
        
        return ""
    }
    
    func toRange(_ range: NSRange) -> Range<String.Index>? {
        
        
        guard let fromIndex = index(startIndex, offsetBy: range.location, limitedBy: endIndex) else { return nil }
        
        guard let toIndex = index(startIndex, offsetBy: range.location + range.length, limitedBy: endIndex) else { return nil }
        
        return fromIndex..<toIndex
    }
    
    func toNSRange(_ range: Range<String.Index>) -> NSRange? {
        
        guard let from = range.lowerBound.samePosition(in: utf16) else { return nil }
        guard let to = range.upperBound.samePosition(in: utf16) else { return nil }
        
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from), length: utf16.distance(from: from, to: to))
    }
    
    func range(with str: String) -> NSRange? {
        
        guard let r = range(of: str) else {
            return nil
        }
        
        return self.toNSRange(r)        
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

public extension Dictionary {
    func string(for key: Key) -> String {
        
        return HBValue(key, default: "")
    }
    
    func int(for key: Key) -> Int {
        return HBValue(key, default: 0)
    }
    
    func bool(for key: Key) -> Bool {
        return HBValue(key, default: false)
    }
    
    func float(for key: Key) -> Float {
        return HBValue(key, default: 0.0)
    }
    
    func HBValue<T>(_ key: Key, `default`: T) -> T {
        return (self[key] as? T) ?? `default`
    }
}

public extension Data {
    
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

