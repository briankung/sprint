source 'https://rubygems.org'
ruby '2.1.0'
#ruby-gemset=sprint

gem 'rails', '4.0.2'

group :development do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

gem 'slim'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

=begin
  IMPORTANT! Some of the defaults have changed in Capybara 2.1. If you're experiencing failures,
  please revert to the old behaviour by setting:

      Capybara.configure do |config|
        config.match = :one
        config.exact_options = true
        config.ignore_hidden_elements = true
        config.visible_text_only = true
      end

  If you're migrating from Capybara 1.x, try:

      Capybara.configure do |config|
        config.match = :prefer_exact
        config.ignore_hidden_elements = false
      end

  Details here: http://www.elabs.se/blog/60-introducing-capybara-2-1
=end