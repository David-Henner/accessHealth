platform :ios, '9.0'
use_frameworks!

target 'theux' do
	pod 'Charts', '~> 3.0.1'


    post_install do |installer|
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
    end

end
