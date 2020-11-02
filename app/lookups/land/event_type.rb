module Land
  class EventType < ApplicationRecord
    include TableName

    lookup_by :event_type, cache: 100, find_or_create: true

    has_many :events
  end
end
