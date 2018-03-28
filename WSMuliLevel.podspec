

Pod::Spec.new do |s|


  s.name         = "WSMuliLevel"
  s.version      = "0.0.1"
  s.summary      = "一种ios多级目录解决方案"

  s.homepage     = "https://github.com/wusaYa/WSMuliLevel"

  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.authors            = { "wusaYa" => "wusaYa@outlook" }

  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/wusaYa/WSMuliLevel.git", :tag => s.version.to_s }
  
  s.source_files  = 'ios 多级目录/**/*.{h,m}'
 
  s.public_header_files = "ios 多级目录/**/*.h"

  s.frameworks = "Foundation", "UIKit"

end
