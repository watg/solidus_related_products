# frozen_string_literal: true

source "https://rubygems.org"

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem "solidus", git: "https://github.com/solidusio/solidus.git", branch: branch

case ENV['DB']
when 'mysql'
  gem 'mysql2', '~> 0.4.10'
when 'postgresql'
  gem 'pg', '~> 0.21'
else
  gem 'sqlite3'
end

gem 'solidus_extension_dev_tools', github: 'solidusio-contrib/solidus_extension_dev_tools'

gemspec
