//
//  Data+HB.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/26.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import Foundation
import CommonCrypto

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
