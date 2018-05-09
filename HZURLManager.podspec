Pod::Spec.new do |s|

  s.name         = "HZURLManager" 
  s.version      = "0.1.5"    
  s.summary      = "URL routing library for iOS,support URL rewrite"
  s.homepage     = "https://github.com/GeniusBrother/HZURLManager.git"
  s.license      = "MIT"
  s.author             = { "GeniusBrother" => "zuohong_xie@163.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/GeniusBrother/HZURLManager.git", :tag => s.version }    
  s.frameworks = "Foundation"

  s.public_header_files = 'HZURLManager/Classes/**/*.h'
  s.source_files = 'HZURLManager/Classes/**/*.{h,m}'

end
