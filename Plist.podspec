#
# Be sure to run `pod lib lint Plist.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Plist"
  s.version          = "1.0.0"
  s.summary          = "A Swift framework to make working with plists easy."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Plist is a Swift library designed to make it easier to work the .plist files in Swift.
It has an API inspired by SwiftyJSON library.
                       DESC

  s.homepage         = "https://github.com/BenziAhamed/Plist"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Benzi Ahamed" => "to.benzi@gmail.com" }
  s.source           = { :git => "https://github.com/BenziAhamed/Plist.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/BenziAhamed'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Plist/Classes/**/*'
  # s.resource_bundles = {
  #   'Plist' => ['Plist/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
