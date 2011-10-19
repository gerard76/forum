source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem "rake", '0.8.7'

gem 'mysql2'
gem 'forem',            :git => "git://github.com/radar/forem.git"
gem 'forem-theme-twist', :git => "git://github.com/radar/forem-theme-twist.git"
gem 'devise'
gem 'unicorn'
gem 'sass-rails',   '~> 3.1.4'
gem 'coffee-rails', '~> 3.1.1'
gem 'uglifier', '>= 1.0.3'
gem 'jquery-rails'
gem "haml", ">= 3.0.0"
gem "haml-rails"

group :production do
  gem 'therubyracer'
end


group :development, :test do
  gem "cucumber-rails", :group => [:development, :test]
  gem "capybara", :group => [:development, :test]
  gem 'capistrano'
  gem "rspec-rails", ">= 2.0.1", :group => [:development, :test]
end