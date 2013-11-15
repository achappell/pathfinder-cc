xcodeproj 'PathfinderCC/PathfinderCC.xcodeproj'

pod 'RestKit/Core', '0.21.0'

post_install do |installer|
  installer.project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['VALID_ARCHS'] = 'armv7, armv7s'
      config.build_settings['SUPPORTED_PLATFORMS'] = "iphonesimulator iphoneos"
      config.build_settings['ARCHS'] = 'armv7, armv7s'
    end
  end
end