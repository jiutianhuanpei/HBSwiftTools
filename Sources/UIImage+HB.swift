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



