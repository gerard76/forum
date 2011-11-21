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
gem 'settingslogic'
gem 'net-ssh'
gem 'net-sftp'
gem 'mixable_engines'

group :production do
  gem 'therubyracer'
end

group :development do
  gem 'capistrano'
  gem 'rb-fsevent',       require: false
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'growl'
  gem 'itslog'
  gem 'mailcatcher'
end

group :test do
  gem "cucumber-rails"
  gem "capybara"
  gem "rspec-rails", ">= 2.0.1"
  gem 'factory_girl_rails'
  gem 'spork', '~> 0.9.0.rc'
end