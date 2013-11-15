xcodeproj 'PathfinderCC/PathfinderCC.xcodeproj'

pod 'RestKit/Core', '0.21.0'

target 'PathfinderCCTests', :exclusive => true do
	pod 'OCMock', '~> 2.2.1'
end

post_install do |installer|
  installer.project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['VALID_ARCHS'] = 'armv7, armv7s, i386'
      config.build_settings['SUPPORTED_PLATFORMS'] = "iphonesimulator iphoneos"
      config.build_settings['ARCHS'] = 'armv7, armv7s, i386'
    end
  end
end