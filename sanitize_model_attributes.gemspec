# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sanitize_model_attributes/version'

Gem::Specification.new do |spec|
  spec.name          = "sanitize_model_attributes"
  spec.version       = SanitizeModelAttributes::VERSION
  spec.authors       = ["Takashi CHIBA"]
  spec.email         = ["mail@takashi.me"]
  spec.summary       = %q{Sanitize ActiveRecord attributes.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/tachiba/sanitize_model_attributes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "loofah", "~> 2"
  spec.add_development_dependency 'minitest'
end
