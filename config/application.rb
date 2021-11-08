require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FoodStaff
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Tokyo'
    
    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja
    
    #以下の記述を追記する(設定必須)
    # config.i18n.load_path += Dir[Rails.root.join('config/locales/*.yml').to_s]
  end
end

