#
# Be sure to run `pod lib lint sizeit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'sizeit'
  s.version          = '0.1.10'
  s.summary          = 'This library is helping me to find what is my current size for particular products like, Skirt, T-shirts, Tops, and others.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: This library is helping me to find what is my current size for particular products like, Skirt, T-shirts, Tops, and others.
                       DESC

  s.homepage         = 'https://github.com/miqyastech/sizeit-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'miqyastech' => 'abdulla@miqyas.net' }
  s.source           = { :git => 'https://github.com/miqyastech/sizeit-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.module_name = "sizeit"
  s.ios.deployment_target = '11.0'
  s.swift_version = '4.0'
    
  s.framework = "UIKit"
  s.dependency 'SwiftyJSON'
  s.dependency 'Alamofire', '~> 4.9.1'
  s.dependency 'ReachabilitySwift', '~> 5.0.0'
  s.dependency 'AlamofireSwiftyJSON'
  s.dependency 'ObjectMapper', '~> 4.2.0'
#  s.dependency 'FBSDKCoreKit'
#  s.dependency 'FBSDKLoginKit'
  s.dependency 'IQKeyboardManagerSwift'
  
  s.source_files = "Sizeit/**/*.{swift,strings}"
  
  s.resources = "Sizeit/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,ttf}"
  
  # s.resource_bundles = {
  #   'sizeit' => ['sizeit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
