# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faraday/rate_limiter/version'

Gem::Specification.new do |spec|
  spec.name          = 'faraday-rate_limiter'
  spec.version       = Faraday::RateLimiter::VERSION
  spec.authors       = ['Cameron Martin']
  spec.email         = ['cameronmartin123@gmail.com']
  spec.description   = %q{Limits the rate of faraday requests}
  spec.summary       = %q{Limits the rate of faraday requests}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'faraday'
end
