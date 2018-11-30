require 'axlsx'
require 'axlsx_rails'
module Blog
  class Engine < ::Rails::Engine
    isolate_namespace Blog
    config.generators.api_only = true
  end
end
