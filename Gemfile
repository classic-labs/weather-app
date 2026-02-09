source "https://rubygems.org"

ruby "3.2.3"

gem "rails", "~> 8.1.2"

gem "sprockets-rails"

gem "devise"

gem "pg"

gem "puma", ">= 5.0"

gem 'open-weather-ruby-client'
gem 'validates_zipcode'

gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem 'dotenv-rails'
  gem "rspec-rails"
  gem "better_errors"
  gem "binding_of_caller"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem 'factory_bot_rails'
  gem "brakeman", require: false
  gem "letter_opener"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'webmock'
  gem "capybara"
  gem "selenium-webdriver"
end
