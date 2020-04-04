# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_related_products/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_related_products'
  s.version     = SolidusRelatedProducts.version
  s.summary     = 'Allows multiple types of relationships between products to be defined'
  s.description = s.summary

  s.required_ruby_version = '~> 2.4'

  s.author       = 'Brian Quinn'
  s.email        = 'brian@railsdog.com'
  s.homepage     = 'https://github.com/solidusio-contrib/solidus_related_products'
  s.license      = 'BSD-3-Clause'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = s.homepage if s.homepage
  end

  s.add_runtime_dependency 'deface', '~> 1.0'
  s.add_runtime_dependency 'solidus_core', ['>= 1.0', '< 3']
  s.add_runtime_dependency 'solidus_backend', ['>= 1.0', '< 3']
  s.add_runtime_dependency 'solidus_support', '>= 0.4', '< 0.6'

  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'solidus_dev_support'
end
