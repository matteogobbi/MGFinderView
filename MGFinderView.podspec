Pod::Spec.new do |s|
  s.name         = 'MGFinderView'
  s.version      = '1.0'
  s.summary      = 'MGFinderView is an animated finder view useful for instance to focus or to suggest a point of the screen to the user.'
  s.homepage     = 'https://github.com/matteogobbi/MGFinderView'
  s.license      = { :type => 'MIT',
                     :file => 'LICENSE' }
  s.author       = { 'Matteo Gobbi' => 'job@matteogobbi.com' }
  s.source       = { :git => 'https://github.com/matteogobbi/MGFinderView.git',
                     :tag => '1.0' }
  s.platform     = :ios, '6.0'
  s.source_files = 'Classes', 'MGFinderView/MGFinderView/*'
  s.frameworks   = 'CoreGraphics', 'UIKit'
  s.requires_arc = true
end
