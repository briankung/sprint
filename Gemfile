source 'https://rubygems.org'
ruby '2.1.0'
#ruby-gemset=sprint

gem 'rails', '4.1.0'

group :development, :test do
  gem 'sqlite3'

  gem 'spring-commands-rspec'
  gem 'rspec-nc'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'slim-rails'
gem 'sass-rails'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end