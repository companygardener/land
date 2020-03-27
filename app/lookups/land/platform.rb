module Land
  class Platform < ApplicationRecord
    include TableName

    lookup_by :platform, cache: 50, find_or_create: true

    has_many :attributions
    has_many :user_agents
  end
end
