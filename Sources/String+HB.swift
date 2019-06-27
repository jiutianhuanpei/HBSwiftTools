//
//  String+HB.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/26.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import Foundation
import CommonCrypto
import UIKit

// MARK: - 字符串截取
public extension String {
    
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
    
    /// 获取子字符串在字符串中的位置
    ///
    /// - Parameter str: 子字符串
    /// - Returns: 位置，若不在，则 range.location == NSNotFound
    func range(with str: String) -> NSRange {
        
        guard let r = range(of: str) else {
            return NSMakeRange(NSNotFound, 0)
        }
        
        guard let range = self.toNSRange(r) else {
            return NSMakeRange(NSNotFound, 0)
        }
        return range
    }
}


//    MARK:- 字符串取值
public extension String {
    /// 取值失败返回 NSNotFound
    var intValue: Int {
        guard let value = Int(self) else { return NSNotFound }
        return value
    }
    
    /// 取值失败返回 Float(NSNotFound)
    var floatValue: Float {
        guard let value = Float(self) else { return Float(NSNotFound) }
        return value
    }
    
    /// 取值失败返回 Double(NSNotFound)
    var doubleValue: Double {
        guard let value = Double(self) else { return Double(NSNotFound) }
        return value
    }
    
    /// 取值失败返回 UInt(NSNotFound)
    var UIntValue: UInt {
        guard let value = UInt(self) else { return UInt(NSNotFound) }
        return value
    }
    
    /// 取值失败返回 UInt8(NSNotFound)
    var UInt8Value: UInt8 {
        guard let value = UInt8(self) else { return UInt8(NSNotFound) }
        return value
    }
    
    /// 取值失败返回 UInt16(NSNotFound)
    var UInt16Value: UInt16 {
        guard let value = UInt16(self) else { return UInt16(NSNotFound) }
        return value
    }
    
    /// 取值失败返回 UInt32(NSNotFound)
    var UInt32Value: UInt32 {
        guard let value = UInt32(self) else { return UInt32(NSNotFound) }
        return value
    }
    
    /// 取值失败返回 UInt64(NSNotFound)
    var UInt64Value: UInt64 {
        guard let value = UInt64(self) else { return UInt64(NSNotFound) }
        return value
    }
    
    /// 取值失败返回 false
    var boolValue: Bool {
        guard let value = Bool(self) else { return false }
        return value
    }
}

//    MARK:- md5加密
public extension String {
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

public extension String {
    
    /// 返回字符串 utf8 编码下的 data，若转换失败则返回 Data()， 其 isEmpty 值为 true
    var data: Data {
        
        if let a = self.data(using: .utf8) {
            return a
        }
        return Data()
    }
}

// MARK: - 字符串转图片，对应的还有图片转字符串
public extension String {
    
    func convertToImage() -> UIImage? {
        
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        let img = UIImage(data: data)
        return img
    }
    
    
}


