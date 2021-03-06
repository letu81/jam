require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Szjam
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.middleware.insert_after ActionDispatch::ParamsParser, ActionDispatch::XmlParamsParser
    config.action_controller.page_cache_directory = "#{Rails.root.to_s}/public/caches"
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.time_zone = 'Beijing'
    config.i18n.default_locale = 'zh-CN'
    config.active_job.queue_adapter = :sidekiq
    config.assets.version = '1.0'
    config.assets.precompile += %w(service.css
	 wap/wap.css
	 home/style.css
	 style.css

	 home/jquery.touchSlider.js
	 home/jquery-1.7.1.min.js
	 home/homeban.js
	 home/plus2015.js
	 home/stellar.js
	 home/home.js

	 wap/jquery.min.js
	 wap/jquery.modal.js
	 wap/swiper.min.js
 	)
  end
end
