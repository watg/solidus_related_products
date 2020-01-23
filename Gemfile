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

gem 'solidus_dev_support', github: 'solidusio/solidus_dev_support'

gemspec
