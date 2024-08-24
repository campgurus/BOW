# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EBWiki
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'ebwiki.org'  # Replace with the origin you want to allow
        resource '*',
                 headers: :any,
                 methods: %i[get post put patch delete options head],
                 expose: ['Access-Control-Allow-Origin'],
                 max_age: 600
      end
    end
  end
end
