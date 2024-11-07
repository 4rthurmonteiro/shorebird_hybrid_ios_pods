Pod::Spec.new do |spec|
  spec.name         = "flutter_module"
  spec.version      = "1.0.0+2"
  spec.summary      = "Flutter module for WebMotors App PF"
  spec.description  = <<-DESC
    Flutter module for WebMotors App PF
                    DESC
  spec.homepage     = "https://bitbucket.org/webmotors/webmotors.posvenda.flutter"
  spec.license      = { :type => "MIT", :text => "Free" }
  spec.author       = { "Arthur Monteiro" => "consultorweb.arthur@webmotors.com.br" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :http => "file://" + __dir__ + "/flutter_module.tar.gz" }
  spec.vendored_frameworks = 'App.xcframework'
  spec.requires_arc = true
  spec.static_framework = true
end
