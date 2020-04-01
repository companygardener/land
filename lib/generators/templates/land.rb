# frozen_string_literal: true

require 'land'

Land.configure do |config|
  # Enable land tracking
  config.enabled = true

  # Uncomment and modify to skip tracking for given paths.
  # config.untracked_paths = %w[
  #   /ping
  #   /status
  # ]

  # Uncomment and modify to skip tracking for given IPs
  # config.untracked_ips = %w[
  #   127.0.0.1
  #   192.168.0.1
  # ]

  # If request.user_agent is blank, this string is saved instead.
  config.blank_user_agent_string = 'user agent missing'

  # Database schema for land tables
  config.schema = 'land'

  # Timeout before a new visit is created
  config.visit_timeout = 1.hour
end
