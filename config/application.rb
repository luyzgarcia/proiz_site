require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module ProizAdmin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.available_locales = [:en, :"pt-BR"]
    config.i18n.default_locale = :"pt-BR"
    #config.i18n.default_locale = :"en"
    
    config.encoding = "utf-8"
    
    # add app/assets/fonts to the asset path
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    
    config.assets.precompile += %w( inicial.js noticias.js especialidades.js trabalhos.js sobre.js admninistrativo.js contato.js)
    #config.assets.enabled = true
    
    #config.assets.logger = false
    #config.assets.debug = true
    #config.assets.logger = false
    
    
    config.exceptions_app = self.routes
    
   # config.assets.precompile += %w( inicial.js)
   # config.assets.precompile += %w( noticias.js )
   # config.assets.precompile += %w( especialidades.js )
   # config.assets.precompile += %w( trabalhos.js )
   # config.assets.precompile += %w( sobre.js )
   # config.assets.precompile += %w( administrativo.js )
   # config.assets.precompile += %w( contato.js )
    
    ActiveSupport::Deprecation.silenced = true
    #config.action_dispatch.default_headers['X-Frame-Options'] = "ALLOW-FROM https://apps.facebook.com"
    config.action_dispatch.default_headers = {
        'X-Frame-Options' => 'ALLOWALL'
    }
  end
end
