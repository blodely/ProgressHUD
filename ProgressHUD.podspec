#
# Be sure to run `pod lib lint ProgressHUD.podspec' to ensure this is a
# valid spec before submitting.
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = 'ProgressHUD'
  s.version = '1.0.2'
  s.summary = 'ProgressHUD wrap lib with quick usage and style settings.'
  s.description = <<-DESC
ProgressHUD wrap lib with quick usage and style settings.
1. SVProgressHUD
2. MBProgressHUD
                       DESC

  s.homepage = 'https://github.com/blodely/ProgressHUD'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Luo Yu' => 'indie.luo@gmail.com' }
  s.source = { :git => 'https://github.com/blodely/ProgressHUD.git', :tag => s.version.to_s }
  s.social_media_url = 'https://weibo.com/blodely'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ProgressHUD/Classes/**/*', 'ProgressHUD/Configurations/*.plist'
  
  # s.resource_bundles = {
  #   'ProgressHUD' => ['ProgressHUD/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.frameworks = 'UIKit'

  s.dependency 'SVProgressHUD', '~> 2.0.3'
  s.dependency 'FCFileManager', '~> 1.0.18'

end
