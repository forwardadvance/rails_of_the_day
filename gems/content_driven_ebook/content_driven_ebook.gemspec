# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'content_driven_ebook/version'

Gem::Specification.new do |spec|
  spec.name          = "content_driven_ebook"
  spec.version       = ContentDrivenEbook::VERSION
  spec.authors       = ["Nicholas Johnson"]
  spec.email         = ["nicholas@forwardadvance.com"]
  spec.description   = %q{Ebook presentation code for the content_driven gem}
  spec.summary       = %q{Content is king. The content_driven gem allows you to define your content using a simple DSL. This gem allows you to take that content and output it as an ebook.}
  spec.homepage      = "http://www.github.com/forwardadvance/content_driven"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "content_driven"
  spec.add_development_dependency "rspec"
end
