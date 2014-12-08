# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_korean/version'

Gem::Specification.new do |spec|
  spec.name          = "fake_korean"
  spec.version       = FakeKorean::VERSION
  spec.authors       = ["Min Soo Kim"]
  spec.email         = ["mskimsid@gmail.com"]
  spec.summary       = %q{similar to faker, but for Korean}
  spec.description   = %q{generatings fake Korean data, such as name, email, phone, address, company_name, etc...}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
