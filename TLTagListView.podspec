Pod::Spec.new do |spec|

  spec.name         = "TLTagListView"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/trongtran0598/TLTagListView.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "trongtran0598" => "cauba278@gmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/trongtran0598/TLTagListView.git", :tag => "#{spec.version}" }
  spec.source_files  = "TLTagListView/**/*.{h,m,swift}"

end