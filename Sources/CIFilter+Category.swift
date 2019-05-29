//
//  CIFilterName.swift
//  SwiftTools
//
//  Created by 沈红榜 on 2019/5/29.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import CoreImage

enum CIFilterName: String {
    case CIAccordionFoldTransition
    case CIAdditionCompositing
    case CIAffineClamp
    case CIAffineTile
    case CIAffineTransform
    case CIAreaAverage
    case CIAreaHistogram
    case CIAreaMaximum
    case CIAreaMaximumAlpha
    case CIAreaMinimum
    case CIAreaMinimumAlpha
    case CIAreaMinMax
    case CIAreaMinMaxRed
    case CIAttributedTextImageGenerator
    case CIAztecCodeGenerator
    case CIBarcodeGenerator
    case CIBarsSwipeTransition
    case CIBicubicScaleTransform
    case CIBlendWithAlphaMask
    case CIBlendWithBlueMask
    case CIBlendWithMask
    case CIBlendWithRedMask
    case CIBloom
    case CIBokehBlur
    case CIBoxBlur
    case CIBumpDistortion
    case CIBumpDistortionLinear
    case CICameraCalibrationLensCorrection
    case CICheckerboardGenerator
    case CICircleSplashDistortion
    case CICircularScreen
    case CICircularWrap
    case CIClamp
    case CICMYKHalftone
    case CICode128BarcodeGenerator
    case CIColorBlendMode
    case CIColorBurnBlendMode
    case CIColorClamp
    case CIColorControls
    case CIColorCrossPolynomial
    case CIColorCube
    case CIColorCubesMixedWithMask
    case CIColorCubeWithColorSpace
    case CIColorCurves
    case CIColorDodgeBlendMode
    case CIColorInvert
    case CIColorMap
    case CIColorMatrix
    case CIColorMonochrome
    case CIColorPolynomial
    case CIColorPosterize
    case CIColumnAverage
    case CIComicEffect
    case CIConstantColorGenerator
    case CIConvolution3X3
    case CIConvolution5X5
    case CIConvolution7X7
    case CIConvolution9Horizontal
    case CIConvolution9Vertical
    case CICopyMachineTransition
    case CICoreMLModelFilter
    case CICrop
    case CICrystallize
    case CIDarkenBlendMode
    case CIDepthBlurEffect
    case CIDepthOfField
    case CIDepthToDisparity
    case CIDifferenceBlendMode
    case CIDiscBlur
    case CIDisintegrateWithMaskTransition
    case CIDisparityToDepth
    case CIDisplacementDistortion
    case CIDissolveTransition
    case CIDither
    case CIDivideBlendMode
    case CIDotScreen
    case CIDroste
    case CIEdgePreserveUpsampleFilter
    case CIEdges
    case CIEdgeWork
    case CIEightfoldReflectedTile
    case CIExclusionBlendMode
    case CIExposureAdjust
    case CIFalseColor
    case CIFlashTransition
    case CIFourfoldReflectedTile
    case CIFourfoldRotatedTile
    case CIFourfoldTranslatedTile
    case CIGammaAdjust
    case CIGaussianBlur
    case CIGaussianGradient
    case CIGlassDistortion
    case CIGlassLozenge
    case CIGlideReflectedTile
    case CIGloom
    case CIGuidedFilter
    case CIHardLightBlendMode
    case CIHatchedScreen
    case CIHeightFieldFromMask
    case CIHexagonalPixellate
    case CIHighlightShadowAdjust
    case CIHistogramDisplayFilter
    case CIHoleDistortion
    case CIHueAdjust
    case CIHueBlendMode
    case CIHueSaturationValueGradient
    case CIKaleidoscope
    case CILabDeltaE
    case CILanczosScaleTransform
    case CILenticularHaloGenerator
    case CILightenBlendMode
    case CILightTunnel
    case CILinearBurnBlendMode
    case CILinearDodgeBlendMode
    case CILinearGradient
    case CILinearToSRGBToneCurve
    case CILineOverlay
    case CILineScreen
    case CILuminosityBlendMode
    case CIMaskedVariableBlur
    case CIMaskToAlpha
    case CIMaximumComponent
    case CIMaximumCompositing
    case CIMedianFilter
    case CIMeshGenerator
    case CIMinimumComponent
    case CIMinimumCompositing
    case CIMix
    case CIModTransition
    case CIMorphologyGradient
    case CIMorphologyMaximum
    case CIMorphologyMinimum
    case CIMotionBlur
    case CIMultiplyBlendMode
    case CIMultiplyCompositing
    case CINinePartStretched
    case CINinePartTiled
    case CINoiseReduction
    case CIOpTile
    case CIOverlayBlendMode
    case CIPageCurlTransition
    case CIPageCurlWithShadowTransition
    case CIParallelogramTile
    case CIPDF417BarcodeGenerator
    case CIPerspectiveCorrection
    case CIPerspectiveTile
    case CIPerspectiveTransform
    case CIPerspectiveTransformWithExtent
    case CIPhotoEffectChrome
    case CIPhotoEffectFade
    case CIPhotoEffectInstant
    case CIPhotoEffectMono
    case CIPhotoEffectNoir
    case CIPhotoEffectProcess
    case CIPhotoEffectTonal
    case CIPhotoEffectTransfer
    case CIPinchDistortion
    case CIPinLightBlendMode
    case CIPixellate
    case CIPointillize
    case CIQRCodeGenerator  //常用的二维码
    case CIRadialGradient
    case CIRandomGenerator
    case CIRippleTransition
    case CIRowAverage
    case CISaliencyMapFilter
    case CISampleNearest
    case CISaturationBlendMode
    case CIScreenBlendMode
    case CISepiaTone
    case CIShadedMaterial
    case CISharpenLuminance
    case CISixfoldReflectedTile
    case CISixfoldRotatedTile
    case CISmoothLinearGradient
    case CISoftLightBlendMode
    case CISourceAtopCompositing
    case CISourceInCompositing
    case CISourceOutCompositing
    case CISourceOverCompositing
    case CISpotColor
    case CISpotLight
    case CISRGBToneCurveToLinear
    case CIStarShineGenerator
    case CIStraightenFilter
    case CIStretchCrop
    case CIStripesGenerator
    case CISubtractBlendMode
    case CISunbeamsGenerator
    case CISwipeTransition
    case CITemperatureAndTint
    case CITextImageGenerator
    case CIThermal
    case CIToneCurve
    case CITorusLensDistortion
    case CITriangleKaleidoscope
    case CITriangleTile
    case CITwelvefoldReflectedTile
    case CITwirlDistortion
    case CIUnsharpMask
    case CIVibrance
    case CIVignette
    case CIVignetteEffect
    case CIVortexDistortion
    case CIWhitePointAdjust
    case CIXRay
    case CIZoomBlur
}

/// 二维码容错级别
///
/// - L: 7%的字码可被修正
/// - M: 15%的字码可被修正
/// - Q: 25%的字码可被修正
/// - H: 30%的字码可被修正
enum QRCorrectionLevel: String {
    case L
    case M
    case Q
    case H
}

extension CIFilter {
    
    /// CIFilter 初始化
    ///
    /// - Parameter name: 枚举值
    convenience init?(name: CIFilterName) {
        self.init(name: name.rawValue)
    }
    
    /// 二维码对应的 CIFilter 初始化
    ///
    /// - Parameters:
    ///   - qrText: 用于生成二维码的的文本
    ///   - correctionLevel: 容错级别
    convenience init?(qrText: String, correctionLevel: QRCorrectionLevel = .M) {
        self.init(name: CIFilterName.CIQRCodeGenerator.rawValue)
        
        if let data = qrText.data(using: .utf8) {
            setValue(data, forKey: "inputMessage")
        }
        setValue(correctionLevel.rawValue, forKey: "inputCorrectionLevel")
    }
    
}

