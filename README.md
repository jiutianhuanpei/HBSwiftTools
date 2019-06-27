# HBSwiftTools                           

![Cocoapods](https://img.shields.io/cocoapods/v/HBSwiftTools.svg)

----

本库是个人总结的一些常用类扩展及通用方法，会不定期更新。

已支持 Cocoapods 安装：

```
pod 'HBSwiftTools'
```

<br/>


### 现有文件

| 文件名 | 描述 |
|:--- |:--- |
[CIFilter+HB.swift](#filter) | CIFilter 的扩展
[Data+HB.swift](#data) | Data 的扩展
[Dictionary+HB.swift](#dictionary) | Dictionary 的扩展
[DispatchTime+HB.swift](#dispatchtime) | DispatchTime 的扩展
[HBPublicFunctions.swift](#public) | 公共的全局方法
[String+HB.swift](#string) | String 的扩展
[UIButton+HB.swift](#button) | UIButton 的扩展
[UICollectionView+HB.swift](#collection) | UICollectionView 的扩展
[UIColor+HB.swift](#color) | UIColor 的扩展
[UIControl+HB.swift](#control) | UIControl 的扩展
[UIImage+HB.swift](#image) | UIImage 的扩展
[UITableView+HB.swift](#table) | UITableView 的扩展
[UIView+HB.swift](#view) | UIView 的扩展

<br/>

---

<style> 
b {
	font-size: 20px;
}

</style>

<b id="filter">CIFilter+HB.swift</b>

这个文件是 CIFilter 的相关扩展，由于系统对 CIFilter 的初始化方法不太友好，所以这里也扩展了对它的初始化方法。

系统的初始化方法是传入一个 name 字符串，天晓得当初的那个“猿”是怎么想的，竟设计出这样牛逼的API，主要是这些字符串实在不好记，不好写，好在有个 API 是获取这些字符串数组的，所以我把这些字符串都拿了出来，封装成了 `CIFilterName` 枚举值，这样好记一些。


践于个人用这个类最多的还是生成二维码，所以对生成二维码相关又进行了一些封装。

首先是对容错级别封装成了 `QRCorrectionLevel` 枚举；

再就是对相应的 Filter 初始化进行了封装。

<br/>

| API | 描述 |
|:---|:---|
`init?(name: CIFilterName)` | 根据传入的 *CIFilterName* 枚举值生成 CIFilter 实例
`init?(qrText: String, correctionLevel: QRCorrectionLevel = .M)` | 根据传入的字符串和 *QRCorrectionLevel* 枚举值生成一个 `CIQRCodeGenerator` 实例


<br/>

<b id="data">Data+HB.swift</b>

| API | 描述 |
|:---|:---|
`var md5: String` | 获取二进制文件的md5值

<br/>

<b id="dictionary">Dictionary+HB.swift</b>

| API | 描述 |
|:---|:---|
`func string(for key: Key) -> String` | 返回字典对应 key 下的 String 类型的 value
`func int(for key: Key) -> Int` | 返回字典对应 key 下的 Int 类型的 value
`func bool(for key: Key) -> String` | 返回字典对应 key 下的 Bool 类型的 value
`func float(for key: Key) -> String` | 返回字典对应 key 下的 Float 类型的 value
`func double(for key: Key) -> String` | 返回字典对应 key 下的 Double 类型的 value
`func HBValue<T>(_ key: Key, `default`: T) -> T` | 返回字典对应 key 下的 T 类型的 value； 如字典为 ["name": "Jim"], 若传入 default == 0: Int, 则因为 "Jim" 转换成 Int 类型会失败，所以方法将返回 0


<br/>

<b id="dispathtime">DispatchTime+HB.swift</b>

给 `DispatchTime` 添加了两个用 `Int` 和 `Double` 类型初始化的方法，方便在 `asyncAfter` 方法中的调用。

eg：

```swift
//延时2秒执行
DispatchQueue.main.asyncAfter(deadline: 2) {
	// do something
}
//延时1.5秒执行
DispatchQueue.main.asyncAfter(deadline: 1.5) {
	// do something
}
```

<br/>

<b id="public">HBPublicFunctions.swift</b>

定义了一些公共的全局方法。

|API|描述|
|:---|:---|
`public func HBInMainThread(_ handler: @escaping ()->Void)` | 在主线程执行代码的 Closure
`public var DocumentPath: String` | 获取 `Documents` 文件夹的路径
`public func FolderPathInDocuments(with folderName: String) -> String` | 获取在 Documents 文件夹下的文件夹路径，若不存在则创建

<br/>

<b id="string">String+HB.swift</b>

`String` 的扩展方法。

| API | 描述 |
|:---|:---|
`func subString<T>(_ range: T) -> String` | 字符串截取。eg：`"0123456789".subString(3..<7)`
`func toRange(_ range: NSRange) -> Range<String.Index>?` | NSRange 转 Range<String.Index>
`func toNSRange(_ range: Range<String.Index>) -> NSRange?` | Range<String.Index> 转 NSRange
`func range(with str: String) -> NSRange?` | 获取子字符串在字符串中的位置
`var intValue: Int` | 字符串转 Int，取值失败返回 NSNotFound
`var floatValue: Float` | 字符串转 Float，取值失败返回 Float(NSNotFound)
`var doubleValue: Double` | 字符串转 Double，取值失败返回 Double(NSNotFound)
`var UIntValue: UInt` | 字符串转 UInt，取值失败返回 UInt(NSNotFound)
`var UInt8Value: UInt8` | 字符串转 UInt8，取值失败返回 UInt8(NSNotFound)
`var UInt16Value: UInt16` | 字符串转 UInt16，取值失败返回 UInt16(NSNotFound)
`var UInt32Value: UInt32` | 字符串转 UInt32，取值失败返回 UInt32(NSNotFound)
`var UInt64Value: UInt64` | 字符串转 UInt64，取值失败返回 UInt64(NSNotFound)
`var boolValue: Bool` | 字符串转 Bool，取值失败返回 false
`var md5: String` | 获取字符串的 md5 值
`var data: Data` | 字符串转 Data
`func convertToImage() -> UIImage?`[^toImage] | base64字符串转图片

<br/>

<b id="button">UIButton+HB.swift</b>

| API | 描述 |
|:---|:---|
`func set(title: String?, titleColor: UIColor?, for state: UIControl.State)` | 设置按钮的文本、文本颜色

<br/>

<b id="collection">UICollectionView+HB.swift</b>


| API | 描述 |
|:---|:---|
`func registerCells(_ cellClasses: AnyClass ...)` | 注册多个cell，传入cell类型，对应indentifier == "\(class)"
`func registerSectionHeaders(_ viewClasses: AnyClass ...)` | 注册多个区头，传入view类型，对应indentifier == "\(class)"
`func registerSectionFooters(_ viewClasses: AnyClass ...)` | 注册多个区尾，传入view类型，对应indentifier == "\(class)"

<br/>

<b id="color">UIColor+HB.swift</b>

| API | 描述 |
|:---|:---|
`convenience init?(_ hexStr: String, alpha: CGFloat = 1)` | 生成十六位颜色
`convenience init(_ hexInt: Int, alpha: CGFloat = 1)` | 生成十六位颜色

<br/>

<b id="control">UIControl+HB.swift</b>

| API | 描述 |
|:---|:---|
`convenience init(with event: UIControl.Event = UIControl.Event.touchUpInside, action: @escaping (UIControl)->Void)` | 用事件触发方式 Event，及事件回调 Closure 初始化一个控件

<b id="image">UIImage+HB.swift</b>

| API | 描述 |
|:---|:---|
`convenience init?(qrText: String, width: CGFloat = 100)` | 根据文案生成二维码图片
`var qrText: String?` | 识别二维码图片的文案
`var base64String: String`[^toString] | 图片转 base64 字符串
`func zoom(to: CGSize) -> UIImage` | 图片绽放，若失败则返回一个size == (0, 0) 的实例
`convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1))` | 根据颜色生成一张纯色的图片

<br/>

<b id="table">UITableView+HB.swift</b>

| API | 描述 |
|:---|:---|
`func registerCells(_ cellClasses: AnyClass ...)` | 注册多个cell，传入cell类型，对应indentifier == "\(class)"
`func registerHeaderFooterViews(_ viewClasses: AnyClass ...)` | 注册多个区头或区尾，传入view类型，对应indentifier == "\(class)"

<br/>

<b id="view">UIView+HB.swift</b>

| API | 描述 |
|:---|:---|
`var x: CGFloat` | 获取或设置 view 的 minX
`var y: CGFloat` | 获取或设置 view 的 minY
`var width: CGFloat` | 获取或设置 view 的 width
`var height: CGFloat` | 获取或设置 view 的 height
`func addSubViews(_ views: UIView ...)` | 添加多个子视图


<br/>


[^toImage]: 可以转图片的字符串，必须是由图片转换成的 base64 字符串。

[^toString]: 图片转换成 base64 字符串，可以用 `func convertToImage() -> UIImage?` 方法再转成图片。
