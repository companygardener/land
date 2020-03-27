module Land
  class Browser < ApplicationRecord
    include TableName

    lookup_by :browser, cache: 50, find_or_create: true

    has_many :user_agents
  end
end
