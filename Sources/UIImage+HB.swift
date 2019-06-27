//
//  HBUI+HB.swift
//  SwiftTools
//
//  Created by 沈红榜 on 2019/5/28.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit
import CoreImage
import ImageIO

// MARK: - 二维码相关
public extension UIImage {
    
    /// 生成一张二维码图片，有可能生成失败
    ///
    /// - Parameters:
    ///   - qrText: 文本
    ///   - width: 图片宽度，默认 100
    convenience init?(qrText: String, width: CGFloat = 100) {
        
        guard let filter = CIFilter(qrText: qrText) else {
            return nil
        }
        
        guard let ciImage = filter.outputImage else {
            return nil
        }
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
        
        let bitmap = CGContext(data: nil, width: Int(width), height: Int(width), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.none.rawValue)!
        
        let ciContext = CIContext(options: nil)
        
        guard let imageRef = ciContext.createCGImage(ciImage, from: ciImage.extent) else {
            return nil
        }
        
        bitmap.interpolationQuality = .none
        
        let scale = width / ciImage.extent.width
        bitmap.scaleBy(x: scale, y: scale)
        bitmap.draw(imageRef, in: ciImage.extent)
        
        guard let resultImgRef = bitmap.makeImage() else {
            return nil
        }
                
        self.init(cgImage: resultImgRef)
    }
    
    /// 识别二维码图片的文本
    var qrText: String? {
        
        let detecor = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: nil)
        
        let ciImage = CIImage(cgImage: cgImage!)
        
        let array = detecor?.features(in: ciImage)
        
        if let feature = array?.first as? CIQRCodeFeature {
            return feature.messageString
        }
        
        return nil
    }
}


// MARK: - 图片转字符串，对应的还有字符串转图片
public extension UIImage {
    
    var base64String: String {
        
        guard let data = jpegData(compressionQuality: 1) else { return "" }
        
        let str = data.base64EncodedString()
        return str
    }
}

// MARK: - 缩放
public extension UIImage {
    
    /// 缩放图片
    ///
    /// - Parameter to: 目标size
    /// - Returns: 缩放后的图片；如果失败，则会返回一个宽高均为0的图片：UIImage()
    func zoom(to: CGSize) -> UIImage {
        
        guard let cgImage = cgImage else { return UIImage() }
        
        UIGraphicsBeginImageContextWithOptions(to, false, 0)
        
        guard let context = UIGraphicsGetCurrentContext() else { return  UIImage() }
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -to.height)
        context.setBlendMode(.multiply)
        context.setAlpha(1)
        context.draw(cgImage, in: .init(origin: .zero, size: to))
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let result = img {
            return result
        }
        return  UIImage()
    }
}

extension UIImage {
    
    /// 根据颜色生成一张纯色的图片
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - size: 要生成的图片的size，default = (1, 1)
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        guard let context = UIGraphicsGetCurrentContext() else { return  nil }

        context.setFillColor(color.cgColor)
        context.fill(.init(origin: .zero, size: size))
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = img?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

