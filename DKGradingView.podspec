Pod::Spec.new do |s|
  s.name         = "DKGradingView"
  s.version      = "1.0.0"
  s.summary      = "Adding grade view to your iOS App."

  s.description  = <<-DESC
                   Easily way to add grading view to your iOS App
                   DESC
  s.license      = "MIT"
  s.author             = { "Draveness" => "stark.draven@gmail.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/Draveness/DKGradingView", :tag => s.version }
  s.source_files  = "Classes/*.{h,m}"
end
