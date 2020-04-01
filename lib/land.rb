# frozen_string_literal: true

require "land/version"
require "land/engine"

require "lookup_by"

module Land
  class Error < StandardError; end

  autoload :Action,  "land/action"
  autoload :Config,  "land/config"
  autoload :Tracker, "land/tracker"

  module Trackers
    autoload :NoopTracker, "land/trackers/noop_tracker"
    autoload :UserTracker, "land/trackers/user_tracker"
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure

    yield config if block_given?

    config
  end
end
