# frozen_string_literal: true

require "rails/engine"
require "action_dispatch"

module Land
  class Engine < ::Rails::Engine
    isolate_namespace Land

    initializer "land.action_controller" do
      ActiveSupport.on_load :action_controller do
        include Land::Action

        helper  Land::Helper
      end
    end
  end
end
