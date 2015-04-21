Pod::Spec.new do |s|
  s.name         = 'FWComplexTableView'
  s.version      = '1.0.1'
  s.license = 'MIT'
  s.homepage     = 'http://www.fanwenqing.com'
  s.authors      = { '范文青' => '23335465@qq.com'}
  s.summary      = 'drap up to load more'

  
  s.platform     =  :ios, '6.0'
  s.source       =  {:git => 'https://github.com/howenis/FWComplexTableView.git', :tag => 'v1.0.1'}
  s.source_files = 'FWComplexTableView/src/**/*.{h,m}'
  s.requires_arc = true
end