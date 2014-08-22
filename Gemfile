source 'https://rubygems.org'
ruby '2.1.2'
#ruby-gemset=sprint

gem 'rails', '~> 4.1.1'

group :development, :test do
  gem 'sqlite3'
end

group :development do
  gem 'spring-commands-rspec'
  gem 'rspec-nc'
  gem 'guard-rspec'
  gem 'rb-fsevent'
end

group :test do
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'rake'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'unicorn'
end

gem 'slim-rails'
gem 'sass-rails', '~> 4.0.3' # Version number required for Rails 4.1.1
gem 'kramdown', require: 'kramdown'
gem 'bootstrap-sass'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'haml'
gem 'devise'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end
