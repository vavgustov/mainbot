source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'

gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 3.4'

gem 'bootsnap', require: false
gem 'draper', '~> 3.0', '>= 3.0.1'
gem 'dotenv-rails'
gem 'faraday', '~> 0.14.0'
gem 'octicons_helper'

group :development, :test do
  gem 'faker'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'poltergeist', '~> 1.17'
  gem 'selenium-webdriver'
end

group :development do
  gem 'debug-extras', '~> 0.4.3'
  gem 'better_errors', '~> 2.4'
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
