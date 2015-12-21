Pod::Spec.new do |s|  
  s.name             = "JJAFNetworking"
  s.version          = "1.0"
  s.summary          = "A Networking Tool used on iOS."  
  s.description      = <<-DESC  
                       封装AFNetworking,使开发者更容易调用网络请求进行应用开发。
                       DESC

  s.homepage         = "https://github.com/JayJJ/JJAFNetworking"
  s.license          = 'MIT'  
  s.author           = { "Jay" => "hzhjjie@gmail.com" }  
  s.source           = { :git => "https://github.com/JayJJ/JJAFNetworking.git", :tag => s.version.to_s }
  
  s.platform     = :ios, '7.0'
  s.requires_arc = true  
  
  s.source_files = "JJAFNetworking/*","JJAFNetworking/Api/*","JJAFNetworking/ListApi/*","JJAFNetworking/Manager/*"

  s.frameworks = 'Foundation', 'UIKit'

  s.dependency 'AFNetworking', '~> 2.6.3'
  s.dependency 'AFDownloadRequestOperation', '~> 2.0.1'
  s.dependency 'MJExtension', '~> 3.0.7'
  
end