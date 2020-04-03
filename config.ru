# frozen_string_literal: true

require "rubygems"
require "bundler"

Bundler.require :default, :development

Combustion.initialize! :active_record,
  database_reset: false,
  load_schema: false,
  database_migrate: false

run Combustion::Application
