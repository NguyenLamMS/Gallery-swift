#
#  Be sure to run `pod spec lint Gallery.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

s.name         = "Gallery-Swift-ms"
s.version      = "2.0.0"
s.summary      = "no summary"
s.description  = <<-DESC
no description
DESC

s.homepage     = "https://github.com/NguyenLamMS/Gallery-swift"
s.license      = "MIT"
s.author             = { "Nguyen Lam" => "lam1997.ln@gmail.com" }
s.platform     = :ios, "9.0"


s.source       = { :git => "https://github.com/NguyenLamMS/Gallery-swift.git", :tag => "#{s.version}" }
s.source_files  = "Gallery", "Gallery/**/*.{h,m,swift}"
end
