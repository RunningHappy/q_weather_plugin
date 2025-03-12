#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint q_weather_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'q_weather_plugin'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  s.dependency 'AFNetworking','~>4.0.0'
  s.dependency 'Flutter'
  s.dependency 'QWeather-SDK'
  s.platform = :ios, '12.0'
  s.static_framework = true

#   s.vendored_frameworks = "QWeather.xcframework"
#   s.preserve_paths = "QWeather.xcframework"

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
#   s.swift_version = '5.0'
end
