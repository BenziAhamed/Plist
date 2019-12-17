Pod::Spec.new do |s|
  s.name             = "Plist"
  s.version          = "1.1.0"
  s.summary          = "A Swift framework to make working with plists easy."

  s.description      = <<-DESC
Plist is a Swift library designed to make it easier to work the .plist files in Swift.
It has an API inspired by SwiftyJSON library.
                       DESC

  s.homepage         = "https://github.com/BenziAhamed/Plist"
  s.license          = 'MIT'
  s.author           = { "Benzi Ahamed" => "to.benzi@gmail.com" }
  s.source           = { :git => "https://github.com/BenziAhamed/Plist.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/BenziAhamed'

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.source_files = 'Common/*'
end
