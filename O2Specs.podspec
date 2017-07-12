Pod::Spec.new do |s|
  s.name         = "O2Specs"
  s.version      = "1.0.0"
  s.summary      = "Just testing"
 s.description  = <<-DESC
                   O2Specs ios sdk.
                   DESC
  s.homepage     = "https://github.com/xiaofeixiaflyingOC/O2Specs.git"
  s.license      = "MIT"
  s.author             = { "shengxin" => "xiaofeixiaflying@163.com" }
  s.source       = { :git => "https://github.com/xiaofeixiaflyingOC/O2Specs.git", :tag =>s.version.to_s }
  s.source_files  = "Classes", "src/BaseProj/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.ios.deployment_target	= '8.0'

  s.ios.dependency 'SDWebImage', '~> 4.0.0'
  s.ios.dependency 'Aspects', '~> 1.4.1'
  s.ios.dependency 'Mantle','~> 2.1.0'
  s.ios.dependency 'AFNetworking', '~> 3.1.0'
  s.ios.dependency 'Masonry','~>1.0.2'
  s.ios.dependency 'CocoaLumberjack', '~> 3.2.0'
  s.ios.dependency 'SDVersion','~> 4.0.2'
  s.ios.dependency 'MLTransition', '~> 2.1.2'
end
