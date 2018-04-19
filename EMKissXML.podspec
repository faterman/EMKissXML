Pod::Spec.new do |s|
  s.name         = 'EMKissXML'
  s.version      = '1.0.0'
  s.summary      = '自己用的一个KissXML版本，支持原创'
  s.homepage     = 'https://github.com/faterman/EMKissXML'
  s.author       = { 'faterman' => 'xxyformobile@163.com' }
  s.source       = { :git => 'git@github.com:faterman/EMKissXML.git', :tag => s.version }

  s.requires_arc = true
  s.default_subspecs = 'Standard'

  s.subspec 'Core' do |ss|
    ss.source_files = 'EMKissXML/**/*.{h,m}'
    ss.library      = 'xml2'
    ss.xcconfig     = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2'}
  end

  s.subspec 'Standard' do |ss|
    ss.dependency 'EMKissXML/Core'
    ss.xcconfig     = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2',
                        'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
                        'OTHER_CFLAGS' => "$(inherited) -DDDXML_LIBXML_MODULE_ENABLED=0"}
  end

  s.subspec 'libxml_module' do |ss|
    ss.dependency 'EMKissXML/Core'
    ss.ios.source_files  = 'EMKissXML/**/*.swift'
    ss.preserve_path = 'libxml/module.modulemap'
    ss.xcconfig     = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2 $(PODS_ROOT)/EMKissXML/libxml "$(PODS_ROOT)/../../../libxml"',
                        'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
                        'OTHER_CFLAGS' => "$(inherited) -DDDXML_LIBXML_MODULE_ENABLED=0",
                        'OTHER_SWIFT_FLAGS' => "$(inherited) -DDDXML_LIBXML_MODULE_ENABLED"
                      }
  end

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
end
