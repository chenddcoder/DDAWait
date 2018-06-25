Pod::Spec.new do |s|
  s.name         = "DDAWait"
  s.version      = "1.0.0"
  s.summary      = ""
  s.homepage     = "https://github.com/chenddcoder/DDAWait"
  s.license      = "MIT"
  s.author             = { "chenddcoder" => "chenddcoder@foxmail.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/chenddcoder/DDAWait.git", :tag => "1.0.0" }
  s.source_files  = "DDAWait/DDAWait/Classes/*.{h,m}"
  s.requires_arc = true
end
