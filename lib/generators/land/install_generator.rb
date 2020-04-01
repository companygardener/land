# frozen_string_literal: true

require "rails/generators"

module Land
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc "Create the Land initializer"

      def copy_initializer
        template "land.rb", "config/initializers/land.rb"
      end
    end
  end
end
