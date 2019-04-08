module MarketplaceWatch
  class Engine < ::Rails::Engine
    isolate_namespace MarketplaceWatch

    config.generators do |g|
      g.orm :mongoid
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_bot, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

  end
end
