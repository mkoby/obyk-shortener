source 'http://rubygems.org'
ruby "2.0.0"

gem 'rails', '3.2.16'
gem "execjs"

group :assets do
  gem 'sass-rails', '~> 3.2'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
end

group :development, :test do
  gem 'sqlite3'
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rspec', '>= 2.0.0'
  gem 'rspec-rails', '>= 2.0.0'
  gem 'factory_girl_rails'
end

group :production do
  gem "pg"
  gem 'newrelic_rpm'
end

