require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tasker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :en
    config.exceptions_app = self.routes

    config.generators do |g|
      g.test_framework :rspec,
                          fixtures: false,
                          view_specs: false,
                          helper_specs: false,
                          routing_specs: false
      g.fixture_replacement :factory_bot , dir: "spec/factories"
      end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
