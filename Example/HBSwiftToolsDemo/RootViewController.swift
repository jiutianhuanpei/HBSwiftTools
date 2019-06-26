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
        
        view.addSubViews(imgView)
        
        let qrImg = UIImage(qrText: "https://www.baidu.com", width: 200)
        imgView.image = qrImg
        
        guard let img = qrImg else { return  }
        
        let base64Str = img.base64String
        
        print("base64Str is :\n\(base64Str)")
        
        guard let baseImg = base64Str.convertToImage() else {
            return
        }
        
        print("baseImg is :\n\(baseImg)")
        imgView.image = baseImg
        
        let img1 = baseImg.zoom(to: .init(width: 100, height: 100))
        let img2 = baseImg.zoom(to: .init(width: 300, height: 300))
        let img3 = baseImg.zoom(to: .init(width: 20, height: 20))

        
        
        print(img1)
    }
    
    
    //    MARK:- 属性
    lazy var imgView: UIImageView = {
        let v = UIImageView(frame: .init(x: 20, y: 100, width: view.width - 40, height: 200))
        v.contentMode = UIView.ContentMode.scaleAspectFit
        return v
    }()
    
}
