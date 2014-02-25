# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'faraday-rate_limiter'
  spec.version       = '0.0.3'
  spec.authors       = ['Cameron Martin']
  spec.email         = ['cameronmartin123@gmail.com']
  spec.description   = %q{Faraday middleware to limit rate of requests}
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/cameron-martin/faraday-rate_limiter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'faraday'
end
