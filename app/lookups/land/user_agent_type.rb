module Land
  class UserAgentType < ApplicationRecord
    include TableName

    lookup_by :user_agent_type, cache: true

    has_many :user_agents
  end
end
