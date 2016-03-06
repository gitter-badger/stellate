source 'https://rubygems.org'

# Core
######################################
gem 'rails', '4.2.5.1'

# Databases
######################################
gem 'pg'
gem 'redis'

# Authentication
######################################
gem 'devise'
gem 'devise-async'
gem 'bcrypt', '~> 3.1.7'

# Admin Interface
######################################
gem 'rails_admin'

# Preprocessors
######################################
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 1.3.0'
gem 'haml'
gem 'redcarpet'

# Image Processing
######################################
gem 'paperclip', '~> 4.2'

# AWS
######################################
gem 'fog'
gem 'fog-aws'

# JavaScript/JQuery Libraries
######################################
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

# Bootstrap
######################################
gem 'bootstrap-sass', '~> 3.3'
gem 'bootstrap_form'

# Iconfonts
######################################
gem 'font-awesome-rails', '~> 4.3.0.0'

# Workers
######################################
gem 'sidekiq'
gem 'sinatra', require: false

# Soft Deletion
######################################
gem "paranoia", "~> 2.0"

# i18n
######################################
gem 'rails-i18n', '~> 4.0.0'
gem 'devise-i18n', '~> 0.12.1'

# User Roles
######################################
gem 'rolify', '~> 5.0'

# User Badges & Points
######################################
gem 'merit'

# Gems only needed for production
######################################
group :production do
  gem 'unicorn'
end

# Gems only needed for development
######################################
group :development, :test do
  gem 'byebug'
  gem 'nokogiri'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', require: false
  gem 'faker'
  gem 'thin'
end

# Gems only needed while testing
######################################
group :test do
  gem 'codecov', require: false
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'better_errors'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
