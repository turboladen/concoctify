require File.expand_path('../boot', __FILE__)
require 'rails'

%w[
  action_controller
  action_mailer
  neo4j
  sprockets
  rails/test_unit
].each do |framework|
  begin
    require "#{framework}/railtie"
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Concoctify
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified
    # here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record
    # auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    # Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from
    # config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    # config.active_record.raise_in_transactional_callbacks = true

    neo4j_config = config_for(:neo4j)
    config.neo4j.session_type = neo4j_config[:server_db]
    config.neo4j.session_path = neo4j_config[:session_path]
    config.neo4j.session_options = neo4j_config[:session_options]

    config.generators do |g|
      g.fixture_replacement :fabrication, dir: 'spec/fabricators'
      g.orm :neo4j
    end
  end
end
