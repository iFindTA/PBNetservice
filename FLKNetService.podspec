Pod::Spec.new do |s|

  s.name         = "FLKNetService"
  s.version      = "3.2.1"
  s.summary      = "network service for iOS development."
  s.description  = "network service for FLK.Inc iOS Developers, such as GET/POST/PUT etc."

  s.homepage     = "https://github.com/iFindTA"
  s.license      = "MIT (LICENSE)"
  s.author             = { "nanhujiaju" => "hujiaju@hzflk.com" }

  s.platform     = :ios, "8.0"
  #s.source       = { :git => "http://192.168.10.99/iOSKits/NetServicePro.git", :tag => "#{s.version}" }
  s.source       = { :git => "http://192.168.10.99/iOSKits/NetServicePro.git", :tag => "#{s.version}" }
  s.source_files  = "FLKNetServicePro/Pod/Classes/Core/*.{h,m}", "FLKNetServicePro/Pod/Classes/*.{h,m}", "FLKNetServicePro/Pod/Category/NSURLSessionTask/*.{h,m}"
  s.public_header_files = "FLKNetServicePro/Pod/Classes/**/*.h", "FLKNetServicePro/Pod/Category/NSURLSessionTask/*.h"

  s.resources    = "FLKNetServicePro/Pod/Assets/*.*"

  #s.libraries		= "CommonCrypto"
  s.frameworks  = "UIKit","Foundation","SystemConfiguration","CFNetwork","Security"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  s.requires_arc = true

  #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/CommonCrypto,$(SRCROOT)/FLKNetService/Core","CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" =>"YES","ONLY_ACTIVE_ARCH" => "NO"}
  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include","CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" =>"YES","ONLY_ACTIVE_ARCH" => "NO"}
  #s.dependency "JSONKit", "~> 1.4"
  s.dependency 'PBKits'
  s.dependency 'AFNetworking'
  s.dependency 'SVProgressHUD'
  s.dependency 'MulticastDelegate'
end

#pod lib lint * --sources='http://192.168.10.99/iOSKits/Specs.git,https://github.com/CocoaPods/Specs.git' --allow-warnings --verbose
#pod repo push FLKSpecs * --sources='http://192.168.10.99/iOSKits/Specs.git,https://github.com/CocoaPods/Specs.git' --allow-warnings --verbose
