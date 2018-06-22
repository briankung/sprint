source 'https://rubygems.org'
ruby '2.5.1'
#ruby-gemset=sprint

gem 'rails', '~> 4.1'
gem 'pg', '~> 0.21'

group :development do
  gem 'spring-commands-rspec'
  gem 'rspec-nc'
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
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
