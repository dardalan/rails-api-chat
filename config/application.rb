require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BackendChat
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.

    #Autoload
    config.autoload_paths += %W(#{config.root}/app/*)
    config.autoload_paths += %W(#{config.root}/app/services)
    config.autoload_paths += %W(#{config.root}/app/uploaders)
    config.autoload_paths += %W(#{config.root}/lib)

    config.api_only = true
    config.action_cable.allowed_request_origins = ['http://192.168.0.103:4200', 'http://192.168.0.159:4200', 'http://localhost:4200', '*']
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*',
        :headers => :any,
        :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client', 'token'],
        :methods => [:get, :post, :patch, :options, :delete, :put]
      end
    end
  end
end
