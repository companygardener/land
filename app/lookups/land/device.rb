module Land
  class Device < ApplicationRecord
    include TableName

    lookup_by :device, cache: 50, find_or_create: true

    has_many :user_agents
  end
end
