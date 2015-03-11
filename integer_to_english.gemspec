# coding: utf-8
require 'pathname'
require Pathname.new(__dir__) + 'lib/integer_to_english/version'

Gem::Specification.new do |spec|
  spec.name          = 'integer_to_english'
  spec.version       = IntegerToEnglish::VERSION
  spec.authors       = ['Viktor Vad']
  spec.email         = ['vad.viktor@gmail.com']
  spec.summary       = %q{Integer.to_english}
  spec.description   = %q{The Integer class is pimped up with the to_english method.}
  spec.homepage      = 'https://github.com/vadviktor/integer_to_english'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
end
