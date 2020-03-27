module Land
  class EventType < ApplicationRecord
    include TableName

    lookup_by :event_type, cache: 100

    has_many :events
  end
end
