source 'https://rubygems.org'

gem 'rails', '4.2.2'
gem 'rails-api', '~> 0.4.0'

# HTML View stuff
gem 'autoprefixer-rails'
gem 'select2-rails'

# Controller things
gem 'active_model_serializers', '~> 0.10.0.rc3', github: 'rails-api/active_model_serializers'
gem 'oj'
gem 'oj_mimic_json'

# Database
gem 'neo4j', '~> 5.2.10'
gem 'ruby-units'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'sdoc', '~> 0.4.0',          group: :doc

group :production do
  # Serving things
  gem 'puma'
end

group :development, :test do
  gem 'byebug'
  gem 'fabrication'
  gem 'faker'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'stackprof'
  gem 'web-console', '~> 2.0'
end

group :development do
  gem 'flamegraph'
  gem 'hairballs'
  gem 'meta_request'
  gem 'quiet_assets'
  gem 'os'
  gem 'rack-minitest'
  gem 'rubocop'
  # gem 'sass-rails-source-maps'
end

group :test do
  gem 'shoulda-matchers', require: false
end
