use_frameworks!
platform :ios, '13.0'

def required_pods

    # networking
    pod 'Apollo'
    pod 'Apollo/SQLite'
    
    # code gen
    pod 'R.swift'
    
    # linter
    pod 'SwiftLint'
end

target 'AwesomeSwiftUI' do
    required_pods
end

target 'AwesomeSwiftUITests' do
    required_pods
    
    # testing
    pod 'Quick'
    pod 'Nimble'
end
