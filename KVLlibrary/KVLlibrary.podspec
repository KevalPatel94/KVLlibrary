Pod::Spec.new do |s|

  s.name         = "KVLlibrary"
  s.version      = "1.1.0"
  s.summary      = "KVLlibrary for Design of UIComponent in Swift"
  s.description  = "This Library is very easy to use. Once you install it open storyboard and give the class type of UICopmonent to KVL class. For example KVLTextfield, KVLLabel, KVLButton etc. and can use the validation functionality by creating the object of class KVLValidation"
  s.homepage     = "https://github.com/KevalPatel94/KVLlibrary.git"
  s.license      = "MIT"
  s.author       = { "Keval Patel" => "kevalpatelstudy@gmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/KevalPatel94/KVLlibrary.git", :tag => "1.1.0" }
  s.source_files  = "KVLlibrary/**/*"

end
