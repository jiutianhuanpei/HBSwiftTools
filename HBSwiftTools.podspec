
Pod::Spec.new do |spec|


  spec.name         = "HBSwiftTools"
  spec.version      = "0.0.2"
  spec.summary      = "一些常用方法及扩展"

  spec.description  = <<-DESC
  	总结的swift下的一些常用方法及扩展
                   DESC

  spec.homepage     = "https://www.shenhongbang.cc"

  spec.license      = "MIT"
  spec.author       = { "jiutianhuanpei" => "shenhongbang@163.com" }

  spec.platform     = :ios, "11.0"

  spec.source       = { :git => "https://github.com/jiutianhuanpei/HBSwiftTools.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/*"
  spec.swift_version = "5.0"

end
