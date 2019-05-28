//
//  HBPublicFunction.swift
//  SwiftTools
//
//  Created by 沈红榜 on 2019/5/28.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import Foundation

/// 回调主线程
///
/// - Parameter handler: 回调
public func HBInMainThread(_ handler: @escaping ()->Void) {
    if Thread.current.isMainThread {
        handler()
    } else {
        DispatchQueue.main.async {
            handler()
        }
    }
}

//MARK:- 文件夹路径

/// Documents 文件夹路径
public var DocumentPath: String {
    guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
        return NSHomeDirectory() + "/Documents"
    }
    return path
}


/// 在 Documents 文件夹下的文件夹路径，若不存在则创建
///
/// - Parameter folderName: 文件夹名称
/// - Returns: 路径
public func FolderPathInDocuments(with folderName: String) -> String {
    let path = DocumentPath + "/\(folderName)"
    
    let manager = FileManager.default
    
    var isDir: ObjCBool = false
    
    let existFile = manager.fileExists(atPath: path, isDirectory: &isDir)
    
    if existFile && !isDir.boolValue {
        //存在一个非文件夹的文件
        try? manager.removeItem(atPath: path)
    }
    
    //不存在文件夹，则创建
    if !existFile {
        try? manager.createDirectory(atPath: path, withIntermediateDirectories: true)
    }
    
    return path
}


