source 'https://rubygems.org'

ruby '2.0.0', engine: 'jruby', engine_version: '1.7.12'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'

# HTML View stuff
gem 'bootstrap-sass', '~> 3.2.0.0'
gem 'autoprefixer-rails'
gem 'select2-rails'

# Assets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'

gem 'sdoc', '~> 0.4.0',          group: :doc

# Serving things
gem 'puma'

# Database
gem 'neo4j', github: 'andreasronge/neo4j'
gem 'ruby-units'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'foreman'

group :development, :test do
  gem 'fabrication'
  gem 'faker'
  gem 'rspec-rails', '~> 3.0.0'
end

group :development do
  gem 'better_errors'
  gem 'meta_request'
  gem 'quiet_assets'
  gem 'os'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', require: false
end
