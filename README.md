# HBSwiftTools

----

本库是个人总结的一些常用类扩展及通用方法，会不定期更新。

已支持 Cocoapods 安装：

```
pod 'HBSwiftTools'
```

<br/>

<style>
hb {
	font-size: 20px
}
</style>

### 现有文件

| 文件名 | 描述 |
|:--- |:--- |
[HBFoundation+Category.swift](#a) | Foundation 框架下相关的类扩展及方法
[HBUI+Category.swift](#b) | UIKit 框架下相关的类扩展及方法
[HBPublicFunctions.swift](#c) | 通用的一些函数
[CIFilter+Category.swift](#d) | CIFilter 的扩展

<br/>
-
---

<hb id="a">HBFoundation+Category.swift</hb>

* **String 的扩展**

	| API | 描述 |
	|---|---|
	`func subString<T>(_ range: T) -> String` | 截取字符串
	`var md5: String { get }` | 获取字符串的 md5 值
	
<br/>

* **Dictionary 的扩展**

	| API | 描述 |
	|---|---|
	 `func string(for key: Key) -> String` | 获取字典中 key 对应的 String 类型的值
	 `func int(for key: Key) -> Int` | 获取字典中 key 对应的 Int 类型的值
	 `func bool(for key: Key) -> Bool` | 获取字典中 key 对应的 Bool 类型的值
	 `func float(for key: Key) -> Float` | 获取字典中 key 对应的 Float 类型的值
	 `func HBValue<T>(_ key: Key, default: T) -> T` | 获取字典中 key 对应的 泛类型的值，其类型由给定的默认值 default 的类型决定

<br/>

* **Data 的扩展**
	
	| API | 描述 |
	|---|---|
	`var md5: String { get }` | 获取二进制的 md5 值


<br/>
<hb id="b">HBUI+Category.swift</hb>

* **UIView 的扩展**

	| API | 描述 |
	|---|---|
	`var x: CGFloat { get set }` | 获取 view 的 minX
	`var y: CGFloat { get set }` | 获取 view 的 minY
	`var width: CGFloat { get set }` | 获取 view 的宽
	`var height: CGFloat { get set }` | 获取 view 的高
	`func addSubViews(_ views: UIView...)` | 向 view 上添加多个子视图
	

<br/>
<hb id="c">HBPublicFunctions.swift</hb>

* **UITableView 的扩展**

	| API | 描述 |
	|---|---|
	`func registerCells(_ cellClasses: AnyClass...)` | 注册多个 cell 类型
	
	<br/>
* **UIColor 的扩展**

	| API | 描述 |
	|---|---|
	`class func color(_ hexStr: String, alpha: CGFloat = 1) -> UIColor?` | 根据十六位色值的字符串生成 RGB 颜色
	`class func color(_ hexInt: Int, alpha: CGFloat = 1) -> UIColor` | 根据十六位色值的 Int 值生成 RGB 颜色
	
	<br/>
* **UIImage 的扩展**

	| API | 描述 |
	|---|---|
	`class func qrImage(with text: String, width: CGFloat = 100) -> UIImage?` | 根据传入的字符串生成二维码

<br/>
<hb id="d">CIFilter+Category.swift</hb>

这个文件是 CIFilter 的相关扩展，由于系统对 CIFilter 的初始化方法不太友好，所以这里也扩展了对它的初始化方法。

系统的初始化方法是传入一个 name 字符串，天晓得当初的那个“猿”是怎么想的，竟设计出这样牛逼的API，主要是这些字符串实在不好记，不好写，好在有个 API 是获取这些字符串数组的，所以我把这些字符串都拿了出来，封装成了 `CIFilterName` 枚举值，这样好记一些。


践于个人用这个类最多的还是生成二维码，所以对生成二维码相关又进行了一些封装。

首先是对容错级别封装成了 `QRCorrectionLevel` 枚举；

再就是对相应的 Filter 初始化进行了封装。

<br/>

| API | 描述 |
|---|---|
`init?(name: CIFilterName)` | 根据传入的 *CIFilterName* 枚举值生成 CIFilter 实例
`init?(qrText: String, correctionLevel: QRCorrectionLevel = .M)` | 根据传入的字符串和 *QRCorrectionLevel* 枚举值生成一个 `CIQRCodeGenerator` 实例

