# Uncomment the next line to define a global platform for your project
platform :ios, '14.1'

# To set iphone simulator deployment target
post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.1'
  end
 end
end

target 'plusOne' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for plusOne
  pod 'GoogleSignIn'
  pod 'FirebaseCore', :git => 'https://github.com/firebase/firebase-ios-sdk.git', :branch => 'master'
  pod 'FirebaseFirestore', :git => 'https://github.com/firebase/firebase-ios-sdk.git', :branch => 'master'

	
end
