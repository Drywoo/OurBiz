# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'OurBiz' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for OurBiz

  pod 'GoogleMLKit/TextRecognitionKorean', '3.2.0'
  pod 'Then'
  pod 'SnapKit', '~> 5.6.0'
  pod 'Alamofire'
  pod 'RxSwift', '6.6.0'
  pod 'RxCocoa', '6.6.0'
  pod 'lottie-ios'
  pod 'RealmSwift', '~>10'

  target 'OurBizTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'OurBizUITests' do
    # Pods for testing
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["ONLY_ACTIVE_ARCH"] = "NO"
    end
  end
end