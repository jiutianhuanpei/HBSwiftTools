//
//  RootViewController.swift
//  HBSwiftToolsDemo
//
//  Created by 沈红榜 on 2019/6/26.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(0xffffff)
        
        let str = "123a"
        
        let float = str.floatValue
        
        if float == Float(NSNotFound) {
            print("no found")
        } else {
            print("==")
        }
        
        
        let img1 = UIImage(qrText: "http://www.baidu.com", width: 200)
        
        print(img1!.qrText!)
        
        print(str.md5)
        print(str.data.md5)
        
        if Data().isEmpty {
            print("is empty")
        }
        
    }
    
}
