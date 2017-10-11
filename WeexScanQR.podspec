# coding: utf-8

Pod::Spec.new do |s|
  s.name         = "WeexScanQR"
  s.version      = "0.0.1"
  s.summary      = "Weex Plugin"

  s.description  = <<-DESC
                   Weexplugin Source Description
                   DESC

  s.homepage     = "https://github.com/WUBOSS/weexScanQR"
  s.license = {
    :type => 'MIT',
    :text => <<-LICENSE
            copyright
    LICENSE
  }
  s.authors      = {
                     "WUBOSS" =>"1054258896@qq.com"
                   }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"

  s.source       = { :git => 'https://github.com/WUBOSS/weexScanQR.git', :tag => '0.0.1' }
  s.source_files  = "ios/Sources", "ios/Sources/**/*.{h,m,mm}"
  s.resources = "ios/Sources/SGQRCode/SGQRCode.bundle","ios/Sources/SGQRCode/SGQRCode.bundle/**/*.{png,caf,plist,strings}"
  s.public_header_files = 'ios/Sources/**/*.h'
  s.requires_arc = true
  s.dependency "WeexPluginLoader"
  s.dependency "WeexSDK"
  s.framework = "AVFoundation"
end
